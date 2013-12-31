require 'bundler/capistrano'
require 'rvm/capistrano'

# De naam van uw applicatie
set :application, "site"

# Gegevens van de Bluerail server
set :host, "mushu.bluerail.nl"
set :user, "lassche"

# Versiebeheer instellingen
set :scm, :git  # Of 'subversion', 'mercurial' , etc.
set :repository,  "git@github.com:Mercurius3/site.git"

# Gebruik de standaard Ruby van de server
set :rvm_ruby_string, 'default'

# De onderstaande instellingen zijn specifiek voor de Bluerail servers, u
# hoeft hier zelf geen wijzigingen in aan te brengen.
set :deploy_to, lambda { capture("echo -n ~/staging") }
set :rvm_type, :system
set :rvm_bin_path, '/usr/local/rvm/bin'
set :use_sudo, false
set :keep_releases, 3

# Bij rvm-capistrano v1.3.0 of hoger dient de volgende regel toegevoegd te worden.
# set :rvm_path, '/usr/local/rvm'

role :web, host
role :app, host
role :db,  host, :primary => true

# Taak voor het herstarten van de Passenger applicatie en symlinken van de database.yml
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  after "deploy:update_code", :link_production_db
end

desc "Link database.yml from shared path"
task :link_production_db do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{deploy_to}/shared/config/initializers/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
  run "ln -nfs #{deploy_to}/shared/config/initializers/devise.rb #{release_path}/config/initializers/devise.rb"
  run "ln -nfs #{deploy_to}/shared/config/application.yml #{release_path}/config/application.yml"
  run "ln -nfs #{deploy_to}/shared/config/app_environment_variables.rb #{release_path}/config/app_environment_variables.rb"
  run "rm -rf #{release_path}/public/uploads} && ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
end
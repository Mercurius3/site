set :stages, %w(production staging)
set :default_stage, "staging"

require 'bundler/capistrano'
require 'rvm/capistrano'
require 'capistrano/ext/multistage'

set :application, "site"

# Gegevens van de Bluerail server
set :host, "mushu.bluerail.nl"
set :user, "lassche"

# Versiebeheer instellingen
set :scm, :git  # Of 'subversion', 'mercurial' , etc.
set :repository,  "git@github.com:Mercurius3/site.git"

# Gebruik de standaard Ruby van de server
# Zou niet meer nodig moeten zijn
set :rvm_ruby_string, 'default'

# De onderstaande instellingen zijn specifiek voor de Bluerail servers, u
# hoeft hier zelf geen wijzigingen in aan te brengen.
# set :deploy_to, lambda { capture("echo -n ~/rails") }
# set :deploy_to, lambda { capture("echo -n ~/staging") }
# set :rvm_type, :system
set :rvm_path, '/usr/local/rvm'
set :rvm_bin_path, '/usr/local/rvm/bin'
set :use_sudo, false
set :keep_releases, 1

set :shared_children, shared_children + %w{public/uploads}

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
  before "deploy:assets:precompile", :create_symlinks
  after "deploy", "deploy:cleanup"
  task :seed do
    run "cd #{deploy_to}/current && bundle exec rake db:seed RAILS_ENV=#{rails_env} && touch tmp/restart.txt"
  end
end

desc "Link database.yml from shared path"
task :create_symlinks do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{deploy_to}/shared/config/initializers/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
  run "ln -nfs #{deploy_to}/shared/config/initializers/devise.rb #{release_path}/config/initializers/devise.rb"
  run "ln -nfs #{deploy_to}/shared/config/application.yml #{release_path}/config/application.yml"
  run "rm -rf #{release_path}/public/uploads} && ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
end

# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'


# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails/tree/master/assets
#   https://github.com/capistrano/rails/tree/master/migrations
#
require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }

# Changed:

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
  run "ln -nfs #{deploy_to}/shared/config/app_environment_variables.rb #{release_path}/config/app_environment_variables.rb"
  run "rm -rf #{release_path}/public/uploads} && ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
end

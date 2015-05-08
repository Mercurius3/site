source 'https://rubygems.org'
# source 'http://production.cf.rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'#, '~>4.0.2'
gem 'rack'#, '~>1.5.2'
gem 'rack-cache'

group :development do
  # gem 'better_errors'
  # gem 'binding_of_caller'
  # gem 'meta_request'
end

# Use sqlite3 as the database for Active Record
group :development, :testing do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  # gem 'rspec-rails', '~> 2.0'
  # gem 'guard-rspec'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'faker'
  # gem 'capybara-webkit'
end

group :production do
#  gem 'mysql2'
gem 'sqlite3'
end

# Use SCSS for stylesheets
gem 'sass-rails'#, '4.0.2'

# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier'#, '>= 1.3.0'
gem 'yui-compressor'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'#, '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'#, '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
group :development do
#  gem 'capistrano-rails', '~> 1.0.0'
end
# gem 'capistrano', '~> 3.0', require: false, group: :development
gem 'capistrano', '~> 2.15'
gem 'rvm-capistrano'
# gem 'capistrano-bundler'
# gem 'capistrano-rvm'

# Use debugger
# gem 'debugger', group: [:development, :test]

# Rails_Admin:
gem 'rails_admin'
gem 'devise'
gem 'rails_admin_nestable'

# Translate Devise Views
gem 'devise-i18n-views'

# Zurb/Foundation
#gem 'compass-rails'
gem 'zurb-foundation'

# Extra
# gem 'icalendar'

# Images
gem 'carrierwave'
# gem 'asset_sync', '>= 1.0.0'
gem 'mini_magick'
gem 'piet'
gem 'piet-binary'

gem 'kramdown'

gem "mailchimp-api"#, "~> 2.0.4"
gem 'gibbon'

gem 'jquery-validation-rails'
gem 'nokogiri'#, '1.5.10'

# Temporarily fixing capistrano and net-ssh bug
gem 'net-ssh'#, '~> 2.7.0'

gem 'metamagic'
gem 'gretel'
gem 'friendly_id'
gem 'rack-page_caching'
gem 'htmlcompressor'
gem 'thin'

require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'carrierwave'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Site
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Europe/Amsterdam'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = :nl
    config.assets.enabled = false
    config.assets.version = '1.2.4'
    config.assets.prefix = '/assets'
		config.assets.precompile += %w( .svg )

		config.exceptions_app = self.routes
		config.active_record.raise_in_transactional_callbacks = true

		config.middleware.use Rack::PageCaching, gzip: false
  end
end

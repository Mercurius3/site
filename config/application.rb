require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'carrierwave'
require 'uglifier'

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
    config.assets.enabled = true
    config.assets.version = '1.2'
    config.assets.prefix = '/assets'
		config.assets.js_compressor = :uglifier
		config.assets.css_compressor = :sass

		config.middleware.use Rack::Deflater
		config.middleware.use HtmlCompressor::Rack, {
			  :enabled => true,
				:remove_multi_spaces => true,
				:remove_comments => true,
				:remove_intertag_spaces => false,
				:remove_quotes => true,
				:compress_css => true,
				:css_compressor => Sass,
				:compress_javascript => true,
				:javascript_compressor => :uglifier,
				:simple_doctype => false,
				:remove_script_attributes => true,
				:remove_style_attributes => true,
				:remove_link_attributes => true,
				:remove_form_attributes => false,
				:remove_input_attributes => true,
				:remove_javascript_protocol => true,
				:remove_http_protocol => false,
				:remove_https_protocol => false,
				:preserve_line_breaks => false,
				:simple_boolean_attributes => true
		}
  end
end

# config/initializers/nav_link_to_helper.rb
#
# nav_link_to https://gist.github.com/firedev/5308768
# nav_link_to_controller https://gist.github.com/firedev/8840403
#
# Provides a `nav_link_to` view helper method that mimics `link_to`,
# but adds a `selected` class if the link equals current page.
# Put into `intializers`.

module ActionView
  module Helpers
    module UrlHelper
      def nav_link_to(name = nil, options = nil, html_options = nil, &block)
        html_options, options = options, name if block_given?
        options ||= {}

        current_page = options.is_a?(String) ? options.split('#')[0] : options
        if current_page?(current_page) || url_for(params).gsub(/\/pages\/.*/, '') == current_page
          html_options ||= {}
          html_options[:class] = '' unless html_options[:class]
          html_options[:class] << ' selected'
        end

        html_options = convert_options_to_data_attributes(options, html_options)

        url = url_for(options)
        html_options['href'] ||= url

        content_tag(:a, name || url, html_options, &block)
      end
    end
  end
end

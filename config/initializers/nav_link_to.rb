# Thanks to Firedev https://gist.github.com/firedev/5308768

module ActionView
 
  module Helpers
 
    module UrlHelper
 
      def nav_link_to(name = nil, options = nil, html_options = nil, &block)
        html_options, options = options, name if block_given?
        options ||= {}
 
        if current_page?(options)
          html_options ||= { }
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
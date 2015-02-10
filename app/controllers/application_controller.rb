require 'mailchimp'

class ApplicationController < ActionController::Base
  
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_nav_var
  # before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :setup_mcapi
 
  def setup_mcapi
    @mc = Mailchimp::API.new(ENV['MAILCHIMP_API_TOKEN'])
    @list_id = ENV['MAILCHIMP_LIST_ID']
    @gb = Gibbon::API.new(ENV['MAILCHIMP_API_TOKEN'])
  end
  
#  protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :first_name
  #   devise_parameter_sanitizer.for(:account_update) << :first_name
  # end
  
#   def devise_parameter_sanitizer
#    if resource_class == User
#       User::ParameterSanitizer.new(User, :user, params)
#    else
#       super
#    end
#  end
  
  private
  def set_nav_var
    @page_nav = Page.order("position")
  end
  
end

require 'mailchimp'

class ApplicationController < ActionController::Base
  
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_nav_var
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :setup_mcapi
 
  def setup_mcapi
    @mc = Mailchimp::API.new('833a16bd5f22a35d0f089cbc9e5bcd87-us1')
    @list_id = "726cc17e5c"
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :first_name
  end
  
  private
  def set_nav_var
    @page_nav = Page.order("position")
  end
  
end

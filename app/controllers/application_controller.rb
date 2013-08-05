class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_nav_var
  
  private
  def set_nav_var
    @page_nav = Page.order("position")
  end
end

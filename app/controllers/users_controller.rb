class UsersController < ApplicationController

  def check_email_exists
    @user = User.find_by_email(params[:user][:email])
    # true if user exists
    respond_to do |format|
      format.json { render json: !@user }
      # returns false if email exists!
      # blocks
    end
  end
  
  def check_email_same_as_current_user_or_unique
    if params[:user][:email] == current_user.email
      @user = nil
      puts "user == current_user" if @user.nil?
      # true if user the same as current user
    else
      @user = User.find_by_email(params[:user][:email])
      puts "user exists" if @user
      # true is user exists
    end
    respond_to do |format|
      format.json { render json: !@user }
      # returns false if user the same as current user OR if email already exists
      # blocks validation
    end
  end
end
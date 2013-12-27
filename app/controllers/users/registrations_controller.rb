class Users::RegistrationsController < Devise::RegistrationsController
  after_action :subscription_checked?, only: [:update]

  def check_email
    @user = User.find_by_email(params[:user][:email])
    respond_to do |format|
      format.json { render :json => !@user }
    end
  end
  
  
  private
  def subscription_checked?
  @gb = Gibbon::API.new(ENV['MAILCHIMP_API_TOKEN'])
    puts current_user.news_letter
    unless current_user.news_letter
      begin
        puts "subscribe"
        @gb.lists.subscribe({
          id: ENV['MAILCHIMP_LIST_ID'], 
          email: {email: current_user.email},
          merge_vars: {
            FNAME: current_user.first_name,
            LNAME: current_user.last_name},
          double_optin: false
        })
      rescue
        puts "rescue: already subscribed, nothing should change"
      end
    else
      begin
        puts "unscubscribe"
        @gb.lists.unsubscribe({
          id: ENV['MAILCHIMP_LIST_ID'], 
          email: {email: current_user.email},
          delete_member: true,
          send_notify: true
        })
      rescue
        puts "rescue: already unsubscribed, nothing should change"
      end
    end
  end
end
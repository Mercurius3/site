class User::ParameterSanitizer < Devise::ParameterSanitizer
  private
  def sign_up
    default_params.permit(:first_name, :last_name, :street, :street_number, :post_code, :city, :email, :password, :password_confirmation, :news_letter, :mobile)
  end
  
  def account_update
    default_params.permit(:first_name, :last_name, :street, :street_number, :post_code, :city, :email, :password, :password_confirmation, :current_password, :news_letter, :mobile)
  end
end
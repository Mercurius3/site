require 'test_helper'
 
class UserFlowsTest < ActionDispatch::IntegrationTest
 
  test "go to login page" do
    get "/auth/login"
    assert_select '#main_content h2', 'Inloggen'
    assert_response :success
  end    
   
  test "login" do
    @user = FactoryGirl.build_stubbed(:user)
    post_via_redirect "/auth/login", new_user: {user_email: @user.email, user_password: @user.password}
    assert_response :success
  end

#  test "foute login" do
#    @user = FactoryGirl.build(:user)
#    post_via_redirect "/users/sign_in", email: @user.email, password: "fout wachtwoord"
#    assert_equal 'Ongeldig mailadres of wachtwoord.', flash[:alert]
#  end
   
  # test "create account subscribe to news_letter while already subscribed to newsletter should work"
  
#  test "changing password should not lead to error" do
#    @user = FactoryGirl.build_stubbed(:user)
#    post_via_redirect "/users/sign_in", email: @user.email, password: @user.password
#    get_via_redirect "/users/edit", password: "nieuwnieuw", password_confirmation: "nieuwnieuw", current_password: @user.password
#    assert_response :success 
#    post_via_redirect "/users/sign_in", email: @user.email, password: "nieuwnieuw"
#    assert_response :success
#    assert "/", path
#  end
#  
#  test "go to login page", js: true do
#    @user = FactoryGirl.build_stubbed(:user)
#    
#  end
end

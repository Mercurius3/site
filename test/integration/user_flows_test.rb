require 'test_helper'
 
class UserFlowsTest < ActionDispatch::IntegrationTest
 
  # test "go to login page" do
  #   @user = FactoryGirl.build_stubbed(:user)
  #   get "/users/sign_in"
  #   assert_response :success
  # end    
  # 
  # test "login" do
  #   @user = FactoryGirl.build_stubbed(:user)
  #   post_via_redirect "/users/sign_in", email: @user.email, password: "wrongpassword"#@user.password
  #   # TODO: NO FAILING TEST YET
  #   assert_response :success
  #   assert "/", path
  # end
  # 
  # # test "create account subscribe to news_letter while already subscribed to newsletter should work"
  # 
  # test "changing password should not lead to error" do
  #   @user = FactoryGirl.build_stubbed(:user)
  #   post_via_redirect "/users/sign_in", email: @user.email, password: @user.password
  #   get_via_redirect "/users/edit", password: "nieuwnieuw", password_confirmation: "nieuwnieuw", current_password: @user.password
  #   # TODO: check that password is changed NO FAILING TEST YET
  #   assert_response :success 
  #   post_via_redirect "/users/sign_in", email: @user.email, password: "nieuwnieuw"
  #   assert_response :success
  #   assert "/", path
  # end
  
  test "go to login page", js: true do
    @user = FactoryGirl.build_stubbed(:user)
    
  end
end

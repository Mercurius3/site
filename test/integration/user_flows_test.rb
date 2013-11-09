require 'test_helper'
 
class UserFlowsTest < ActionDispatch::IntegrationTest
  @user = User.create!(first_name: "Jan", last_name: "Jansen", )
  test "login and browse site" do
    # login via https
    https!
    get "/users/sign_in"
    assert_response :success

    post_via_redirect "/users/sign_in", email: users(:one).email, password: users(:one).password
    # assert_equal '/', path
    assert_equal 'Je bent succesvol ingelogd.', flash[:notice]
    
    #  
    # https!(false)
    # get "/posts/all"
    # assert_response :success
    # assert assigns(:products)
  end
end
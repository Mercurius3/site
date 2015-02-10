require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	test "login succeeds" do
		FactoryGirl.build_stubbed(@user)
		@request.env["devise.mapping"] = Devise.mappings[:user]
		sign_in :user, @user
		assert_equal "true", current_user.email
	end

end

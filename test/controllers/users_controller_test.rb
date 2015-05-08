require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	def setup
		@request.env["devise.mapping"] = Devise.mappings[:user]
		@admin = FactoryGirl.create(:admin)
		sign_in @admin

		@user = FactoryGirl.create(:user)
		sign_in @user
	end
	
	test "admin has admin rights" do
		assert_equal(@admin.admin, true)
	end

	test "user has no admin rights" do
		assert_equal(@user.admin, false)
	end

end

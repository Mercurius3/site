require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User aanmaken lukt" do
    User.create!(first_name: users(:one).first_name, last_name: users(:one).last_name)
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User aanmaken lukt" do
    user = FactoryGirl.build(:user)
    assert user.save
  end
  
  # test "Street number should not be saved without a street_number" do
  #   user = FactoryGirl.build(:user_without_street_number)
  #   assert !user.save, "user should not be saved without a street number"
  # end
end

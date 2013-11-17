require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Product without name shouldn't save" do
    product = FactoryGirl.build(:product, name: nil)
    assert !product.save, "Product without name shouldn't save"
  end
  
  test "Product description should be optional" do
    product = FactoryGirl.build(:product, description: nil)
    assert product.save, "Product description should be optional"
  end
  
  test "Product price should be optional" do
    product = FactoryGirl.build(:product, price: nil)
    assert product.save, "Product price should be optional"
  end
  
  test "Product startddate should be optional" do
    product = FactoryGirl.build(:product, startdate: nil)
    assert product.save, "Product startdate should be optional"
  end

  test "Product startdate should be a date" do
    product = FactoryGirl.create(:product, startdate: Date.today)
    assert_kind_of(Date, product.startdate)
  end
  
  test "Product startdate should only save if it is a date" do
    product = FactoryGirl.create(:product, startdate: "I'm afraid of no dates")
    assert_nil product.startdate
  end
end

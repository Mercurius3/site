require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Product without name shouldn't save" do
    product = FactoryGirl.build(:product, name: nil)
    assert !product.save, "Product without name shouldn't save"
  end

	test "Product without price shouldn't save" do
		product = FactoryGirl.build(:product, price: nil)
		assert_nil(product.price)
		assert !product.save, "Product without price shouldn't save"
	end
  
	test "Product without description shouldn't save" do
		product = FactoryGirl.build(:product, description: nil)
		assert_nil(product.description)
		assert !product.save, "Product without description shouldn't save"
	end
	
	test "Product without startdate shouldn't save" do
		product = FactoryGirl.build(:product, startdate: nil)
		assert_nil(product.startdate)
		assert !product.save, "Product without startdate shouldn't save"
	end
end

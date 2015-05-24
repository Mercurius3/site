class AddPurchasableToProducts < ActiveRecord::Migration
  def change
    add_column :products, :purchasable, :boolean
  end
end

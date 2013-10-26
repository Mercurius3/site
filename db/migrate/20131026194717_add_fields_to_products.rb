class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :short_description, :text
    add_column :products, :payment_details, :text
    add_column :products, :third_party, :boolean
  end
end

class AddStartdateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :startdate, :date
  end
end

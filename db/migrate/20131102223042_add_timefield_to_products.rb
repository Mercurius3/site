class AddTimefieldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :timefield, :text
  end
end

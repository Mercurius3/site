class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.boolean :accept_conditions
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end

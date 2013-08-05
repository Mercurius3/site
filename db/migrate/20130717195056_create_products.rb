class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :location_id
      t.integer :teacher_id
      t.boolean :active
      t.decimal :price
      t.integer :position
      t.integer :category_id
      t.string :picture

      t.timestamps
    end
    add_index :products, :teacher_id
    add_index :products, :active
    add_index :products, :category_id
  end
end

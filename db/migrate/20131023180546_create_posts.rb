class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.boolean :active
      t.integer :position
      t.string :picture

      t.timestamps
    end
  end
end

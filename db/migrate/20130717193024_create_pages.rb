class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.string :permalink
      t.integer :position

      t.timestamps
    end
  end
end

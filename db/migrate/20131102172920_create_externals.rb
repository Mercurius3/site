class CreateExternals < ActiveRecord::Migration
  def change
    create_table :externals do |t|
      t.string :name
      t.date :start_date
      t.text :description
      t.integer :position
      t.boolean :active

      t.timestamps
    end
  end
end

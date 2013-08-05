class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.time :starttime
      t.time :endtime
      t.date :eventdate
      t.integer :product_id

      t.timestamps
    end
  end
end

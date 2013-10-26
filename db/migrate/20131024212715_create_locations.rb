class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :city
      t.string :longitude
      t.string :latitude
    end
  end
end

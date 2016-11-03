class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :formatted_location_full
      t.timestamps
    end
  end
end

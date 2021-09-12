class CreateVehicleLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicle_locations do |t|
      t.datetime :time
      t.string :latitude
      t.string :longitude
      t.string :location
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGeographicLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :geographic_locations do |t|
      t.string :location_in_publication
      t.string :city
      t.string :state
      t.string :country
      t.string :continent
      t.decimal :latitude, precision: 6, scale: 4
      t.decimal :longitude, precision: 6, scale: 4
      t.timestamps
    end
  end
end

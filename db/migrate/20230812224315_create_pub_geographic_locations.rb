class CreatePubGeographicLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_geographic_locations do |t|
      t.references :publication
      t.references :geographic_location
      t.timestamps
    end
  end
end

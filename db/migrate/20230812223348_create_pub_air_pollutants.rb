class CreatePubAirPollutants < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_air_pollutants do |t|
      t.references :publication
      t.references :air_pollutant
      t.timestamps
    end
  end
end

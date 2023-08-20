class CreateAirPollutants < ActiveRecord::Migration[7.0]
  def change
    create_table :air_pollutants do |t|
      t.string :full_name
      t.string :abbreviation
      t.text :comment
      t.timestamps
    end
  end
end

class CreatePubWeatherRelationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_weather_relation_codes do |t|
      t.references :publication
      t.references :weather
      t.references :relation_code
      t.text :comment
      t.timestamps
    end
  end
end

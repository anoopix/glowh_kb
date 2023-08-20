class CreatePubAirPollutantMetaVariables < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_air_pollutant_meta_variables do |t|
      t.references :publication
      t.references :air_pollutant
      t.references :meta_variable
      t.decimal :value, precision: 4, scale: 3
      t.decimal :upper_limit, precision: 4, scale: 3
      t.decimal :lower_limit, precision: 4, scale: 3
      t.string :annotation
      t.timestamps
    end
  end
end

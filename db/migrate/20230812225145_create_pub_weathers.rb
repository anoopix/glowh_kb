class CreatePubWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_weathers do |t|
      t.references :publication
      t.references :weather
      t.timestamps
    end
  end
end

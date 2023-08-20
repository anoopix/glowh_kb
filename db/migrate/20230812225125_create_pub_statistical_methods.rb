class CreatePubStatisticalMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_statistical_methods do |t|
      t.references :publication
      t.references :statistical_method
      t.timestamps
    end
  end
end

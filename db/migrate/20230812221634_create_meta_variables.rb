class CreateMetaVariables < ActiveRecord::Migration[7.0]
  def change
    create_table :meta_variables do |t|
      t.string :name
      t.string :code
      t.timestamps
    end
  end
end

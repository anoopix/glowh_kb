class CreateRelationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :relation_codes do |t|
      t.string :relation
      t.timestamps
    end
  end
end

class CreateDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :diseases do |t|
      t.string :name
      t.string :icd_code
      t.integer :version
      t.string :comment
      t.timestamps
    end
  end
end

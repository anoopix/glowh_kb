class CreatePubDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_diseases do |t|
      t.references :publication
      t.references :disease
      t.text :comment
      t.timestamps
    end
  end
end

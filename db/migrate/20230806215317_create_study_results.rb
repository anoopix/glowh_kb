class CreateStudyResults < ActiveRecord::Migration[7.0]
  def change
    create_table :study_results do |t|
      t.references :publication
      t.string :outcome
      t.text :comment
      t.timestamps
    end
  end
end

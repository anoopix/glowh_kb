class CreateStudyOutcomes < ActiveRecord::Migration[7.0]
  def change
    create_table :study_outcomes do |t|
      t.string :outcome
      t.text :comment
      t.references :publication
      t.timestamps
    end
  end
end

class CreateStudyPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :study_periods do |t|
      t.references :publication
      t.integer :start_year
      t.integer :start_month
      t.integer :end_year
      t.integer :end_month
      t.text :comment
      t.timestamps
    end
  end
end

class CreateStudyPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :study_periods do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :comment
      t.references :publication
      t.timestamps
    end
  end
end

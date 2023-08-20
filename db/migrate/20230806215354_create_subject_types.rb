class CreateSubjectTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :subject_types do |t|
      t.string :name
      t.text :comment
      t.timestamps
    end
  end
end

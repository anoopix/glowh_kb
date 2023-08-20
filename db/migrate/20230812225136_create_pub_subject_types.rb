class CreatePubSubjectTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_subject_types do |t|
      t.references :publication
      t.references :subject_type
      t.text :comment
      t.timestamps
    end
  end
end

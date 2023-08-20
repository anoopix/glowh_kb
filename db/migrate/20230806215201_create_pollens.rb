class CreatePollens < ActiveRecord::Migration[7.0]
  def change
    create_table :pollens do |t|
      t.string :pollen_type
      t.text :comment
      t.timestamps
    end
  end
end

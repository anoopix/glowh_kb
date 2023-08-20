class CreateWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :weathers do |t|
      t.string :primary
      t.string :secondary
      t.string :derived
      t.text :comment
      t.timestamps
    end
  end
end

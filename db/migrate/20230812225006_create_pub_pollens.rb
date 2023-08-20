class CreatePubPollens < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_pollens do |t|
      t.references :publication
      t.references :pollen
      t.timestamps
    end
  end
end

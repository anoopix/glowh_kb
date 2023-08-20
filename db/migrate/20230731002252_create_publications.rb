class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :authors
      t.string :journal
      t.datetime :published_at
      t.string :url
      t.string :doi
      t.string :access
      t.timestamps
    end
  end
end

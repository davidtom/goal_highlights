class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :title
      t.string :permalink
      t.string :url
      t.text :media
      t.text :media_embed
      t.text :secure_media
      t.text :secure_media_embed
      t.integer :created
      t.integer :created_utc
      t.integer :domain_id
      t.integer :player_id
      t.timestamps
    end
  end
end

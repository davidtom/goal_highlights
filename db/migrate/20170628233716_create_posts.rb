class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :permalink
      t.string :url
      t.text :media
      t.text :media_embed
      t.text :secure_media
      t.text :secure_media_embed
      t.integer :created
      t.integer :created_utc
      t.datetime :date_indexed
      t.integer :domain_id
    end
  end
end

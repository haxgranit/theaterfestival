class CreateArtistSocialMetadata < ActiveRecord::Migration
  def change
    create_table :artist_social_metadata do |t|
      t.text :twitter
      t.text :facebook
      t.text :linkedin
      t.text :tumblr
      t.text :snapchat
      t.text :email
      t.text :website
      t.text :instagram
      t.text :vine
      t.references :artist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

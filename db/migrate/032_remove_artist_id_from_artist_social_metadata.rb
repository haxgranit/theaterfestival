class RemoveArtistIdFromArtistSocialMetadata < ActiveRecord::Migration
  def change
    remove_foreign_key :artist_social_metadata, :artist
    remove_column :artist_social_metadata, :artist_id, :integer
  end
end

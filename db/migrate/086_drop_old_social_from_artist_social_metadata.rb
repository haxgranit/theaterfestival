class DropOldSocialFromArtistSocialMetadata < ActiveRecord::Migration
  def change
    remove_column :artist_social_metadata, :snapchat
    remove_column :artist_social_metadata, :vine
  end
end

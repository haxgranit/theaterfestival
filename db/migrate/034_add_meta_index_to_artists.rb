class AddMetaIndexToArtists < ActiveRecord::Migration
  def change
    remove_index :artists, :artist_social_metadata_id
    add_index :artists, :artist_social_metadata_id, unique: true
  end
end

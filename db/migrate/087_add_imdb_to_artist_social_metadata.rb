class AddImdbToArtistSocialMetadata < ActiveRecord::Migration
  def change
    add_column :artist_social_metadata, :imdb, :text
  end
end

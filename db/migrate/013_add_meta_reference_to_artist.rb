class AddMetaReferenceToArtist < ActiveRecord::Migration
  def change
    add_reference :artists, :artist_social_metadata, index: true, foreign_key: true
  end
end

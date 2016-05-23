class ArtistSocialMetadata < ActiveRecord::Base
  validates_uniqueness_of :artist_id
  belongs_to :artist
end

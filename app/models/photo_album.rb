class PhotoAlbum < ActiveRecord::Base
  belongs_to :has_album, polymorphic: true

  validates :title, presence: true
end

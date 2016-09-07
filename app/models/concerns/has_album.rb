module HasAlbum
  extend ActiveSupport::Concern

  included do
    has_many :albums, as: :has_album, class_name: 'PhotoAlbum'
    has_many :photos, through: :albums
    accepts_nested_attributes_for :albums
  end
end

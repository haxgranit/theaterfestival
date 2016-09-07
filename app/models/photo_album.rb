class PhotoAlbum < ActiveRecord::Base
  belongs_to :has_album, polymorphic: true
  has_many :photos
  accepts_attachments_for :photos, attachment: :photo
  accepts_nested_attributes_for :photos

  include PublicActivity::Model
  tracked owner: :has_album
  validates :title, presence: true
end

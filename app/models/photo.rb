class Photo < ActiveRecord::Base
  belongs_to :photo_album
  attachment :photo

  validates :title, :credit, presence: true
end

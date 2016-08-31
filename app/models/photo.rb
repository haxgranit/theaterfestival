class Photo < ActiveRecord::Base
  belongs_to :photo_album

  validates :title, :credit, presence: true
end

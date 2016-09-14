class Venue < ActiveRecord::Base
  include Permissible
  include HasAlbum
  include PublicActivity::Common
  searchkick word_start: [:name], searchable: [:name]
  validates :company_id, presence: true
  attachment :venue_image
  attachment :banner_image

  belongs_to :company
  has_many :theaters
  has_many :showtimes, through: :theaters
end

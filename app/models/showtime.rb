class Showtime < ActiveRecord::Base
  validates :showtime, :theater_id, presence: true
  validates_uniqueness_of :showtime, scope: [:theater_id]

  belongs_to :theater
  has_one :production, through: :production_showtime_links
  has_many :production_showtime_links
  has_one :venue, through: :theater
  has_one :showtime_ticket_metadata
  has_one :showtime_accessibility_metadata
end

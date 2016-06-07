class Showtime < ActiveRecord::Base
  validates :showtime, :theater_id, presence: true
  validates_uniqueness_of :showtime, scope: [:theater_id]

  belongs_to :theater
  has_one :production_showtime_link
  has_one :production, through: :production_showtime_link
  has_one :venue, through: :theater
  has_one :showtime_ticket_metadata
  has_one :showtime_accessibility_metadata

  def local_time
    showtime.in_time_zone(venue.time_zone)
  end
end

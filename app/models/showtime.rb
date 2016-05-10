class Showtime < ActiveRecord::Base
  belongs_to :theater
  has_one :production, through: :production_showtime_links
  has_one :showtime_ticket_metadata
  has_one :showtime_accessibility_metadata
end

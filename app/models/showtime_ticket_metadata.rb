class ShowtimeTicketMetadata < ActiveRecord::Base
  validates :showtime_id, presence: true
  validates_uniqueness_of :showtime_id
  belongs_to :showtime
end

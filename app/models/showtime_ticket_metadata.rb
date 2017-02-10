class ShowtimeTicketMetadata < ActiveRecord::Base
  delegate :valid?, to: :showtime, prefix: true, allow_nil: true
  validates_uniqueness_of :showtime_id
  belongs_to :showtime
end

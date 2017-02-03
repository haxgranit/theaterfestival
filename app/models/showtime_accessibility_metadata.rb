class ShowtimeAccessibilityMetadata < ActiveRecord::Base
  validates_uniqueness_of :showtime_id
  belongs_to :showtime
end

class Theater < ActiveRecord::Base
  belongs_to :venue
  has_many :showtimes
  has_many :showtime_accessibility_meta, through: :showtimes
end

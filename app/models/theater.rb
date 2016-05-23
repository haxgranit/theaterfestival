class Theater < ActiveRecord::Base
  validates :name, :venue_id, presence: true
  validates_uniqueness_of :name, scope: [:venue_id]

  belongs_to :venue
  has_many :showtimes
  has_many :showtime_accessibility_meta, through: :showtimes
end

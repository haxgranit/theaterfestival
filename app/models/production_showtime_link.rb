class ProductionShowtimeLink < ActiveRecord::Base
  validates_uniqueness_of :production_id, scope: :showtime_id
  belongs_to :production
  belongs_to :showtime
end

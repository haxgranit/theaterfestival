class ProductionShowtimeLink < ActiveRecord::Base
  belongs_to :production
  belongs_to :showtime
end

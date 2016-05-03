class Production < ActiveRecord::Base
  has_many :artists, through: :production_credits
  has_many :companies, through: :company_production_links
  has_many :festivals, through: :festival_production_links
  has_many :press_items
  has_many :reviews
  has_many :showtimes, through: :production_showtime_links
  has_one :production_metadata
end

class Production < ActiveRecord::Base
  validates :title, :first_performance, :last_performance, presence: true
  attachment :key_image

  has_many :production_credits
  has_many :artists, through: :production_credits
  has_many :companies, through: :company_production_links
  has_many :company_production_links
  has_many :festivals, through: :festival_production_links
  has_many :festival_production_links
  has_many :press_items
  has_many :reviews
  has_many :showtimes, through: :production_showtime_links
  has_many :production_showtime_links
  has_one :production_metadata
end

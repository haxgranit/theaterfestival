class Company < ActiveRecord::Base
  has_many :festivals, through: :company_festival_links
  has_many :festival_productions, through: :festival_production_links
  has_many :productions, through: :company_production_links
  has_many :company_production_links
  has_many :showtimes, through: :theaters
  has_many :theaters, through: :venues
  has_many :venues
  has_one :company_metadata
  has_one :company_social_metadata
end

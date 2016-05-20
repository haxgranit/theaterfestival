class Festival < ActiveRecord::Base
  has_many :companies, through: :company_festival_links
  has_many :productions, through: :festival_production_links
  has_many :company_festival_links
  has_many :festival_production_links
end

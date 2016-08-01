class Festival < ActiveRecord::Base
  include Permissible
  searchkick word_start: [:title], searchable: [:title]
  validates :title, presence: true

  has_many :companies, through: :company_festival_links
  has_many :productions, through: :festival_production_links
  has_many :company_festival_links
  has_many :festival_production_links
end

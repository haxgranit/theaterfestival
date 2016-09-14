class Festival < ActiveRecord::Base
  include Permissible
  include HasAlbum
  include PublicActivity::Common
  searchkick word_start: [:title], searchable: [:title]
  validates :title, presence: true
  attachment :festival_image
  attachment :banner_image

  has_many :companies, through: :company_festival_links
  has_many :productions, through: :festival_production_links
  has_many :company_festival_links
  has_many :festival_production_links
end

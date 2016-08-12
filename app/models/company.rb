class Company < ActiveRecord::Base
  include Permissible
  include Metadata
  include SocialTarget
  include PublicActivity::Common

  searchkick word_start: [:name], searchable: [:name]
  validates :name, presence: true
  validates :website, url: true, allow_blank: true
  attachment :company_image


  has_many :company_festival_links
  has_many :festivals, through: :company_festival_links
  has_many :festival_production_links, through: :productions
  has_many :productions, through: :festival_production_links, as: :festival_productions
  has_many :company_production_links
  has_many :productions, through: :company_production_links

  has_many :venues
  has_many :theaters, through: :venues
  has_many :showtimes, through: :theaters
  has_one :company_metadata
  has_one :company_social_metadata
  accepts_nested_attributes_for :company_metadata
  accepts_nested_attributes_for :company_social_metadata

  def social_links
    collect_metadata company_social_metadata
  end

  def metadata
    collect_metadata company_metadata
  end
end

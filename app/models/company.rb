class Company < ActiveRecord::Base
  include Permissible
  include Metadata
  include SocialTarget
  include HasAlbum
  include PublicActivity::Model
  tracked

  searchkick word_start: [:name], searchable: [:name]
  validates :name, presence: true
  validates :website, url: true, allow_blank: true
  attachment :company_image
  attachment :banner_image

  belongs_to :user
  has_many :productions
  accepts_nested_attributes_for :productions

  has_many :credits, as: :creditable
  accepts_nested_attributes_for :credits
  has_many :artists, through: :credits


  has_many :company_festival_links
  has_many :festivals, through: :company_festival_links
  has_many :company_production_links
  has_many :coproductions, through: :company_production_links, source: :production

  has_many :venues
  accepts_nested_attributes_for :venues
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

  def all_productions

  end

end

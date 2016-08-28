class Production < ActiveRecord::Base
  include Permissible
  include Metadata
  include SocialTarget
  include PublicActivity::Common
  paginates_per 9

  searchkick word_start: [:title], searchable: [:title]
  validates :title, :first_performance, presence: true
  attachment :key_image

  has_many :credits, as: :creditable
  accepts_nested_attributes_for :credits
  has_many :artists, through: :credits

  belongs_to :company
  has_many :companies, through: :company_production_links
  has_many :company_production_links
  has_many :festivals, through: :festival_production_links
  has_many :festival_production_links
  has_many :press_items
  has_many :reviews
  has_many :showtimes, through: :production_showtime_links
  has_many :theaters, through: :showtimes
  has_many :venues, through: :theaters
  has_many :production_showtime_links
  has_one :production_metadata
  accepts_nested_attributes_for :production_metadata, reject_if: :all_blank, allow_destroy: true
  has_many :pictures, as: :has_image
  accepts_attachments_for :pictures, attachment: :image

  alias_attribute :name, :title


  def metadata
    collect_metadata(production_metadata)
  end


end

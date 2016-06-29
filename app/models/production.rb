class Production < ActiveRecord::Base
  searchkick word_start: [:title], searchable: [:title]
  validates :title, :first_performance, presence: true
  attachment :key_image

  has_many :credits
  delegate :writing_credits, :production_credits, to: :credits
  has_many :artists, through: :credits
  has_many :companies, through: :company_production_links
  has_many :company_production_links
  has_many :festivals, through: :festival_production_links
  has_many :festival_production_links
  has_many :press_items
  has_many :reviews
  has_many :showtimes, through: :production_showtime_links
  has_many :production_showtime_links
  has_one :production_metadata
  accepts_nested_attributes_for :production_metadata

  def metadata
    if production_metadata.present?
      production_metadata
        .attributes
        .except('id', 'production_id', 'created_at', 'updated_at')
        .delete_if { |_, v| v.blank? }
    end
  end
end

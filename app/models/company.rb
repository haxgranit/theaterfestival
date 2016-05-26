class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :website, url: true
  attachment :company_image


  has_many :festivals, through: :company_festival_links
  has_many :festival_productions, through: :festival_production_links
  has_many :productions, through: :company_production_links
  has_many :company_production_links
  has_many :showtimes, through: :theaters
  has_many :theaters, through: :venues
  has_many :venues
  has_one :company_metadata
  has_one :company_social_metadata
  accepts_nested_attributes_for :company_metadata
  accepts_nested_attributes_for :company_social_metadata

  def social_links
    if company_social_metadata
      company_social_metadata
        .attributes
        .except('id', 'company_id', 'created_at', 'updated_at')
        .delete_if { |_, v| v.blank? }
    end
  end

  def metadata
    if company_metadata
      company_metadata
        .attributes
        .except('id', 'company_id', 'created_at', 'updated_at')
        .delete_if { |_, v| v.blank? }
    end
  end
end

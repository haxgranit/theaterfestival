class Venue < ActiveRecord::Base
  acts_as_mappable auto_geocode: { field: :full_address, error_message: 'Error geocoding' }
  include Permissible
  include HasAlbum
  include SocialTarget
  include PublicActivity::Common
  searchkick word_start: [:name], searchable: [:name]
  validates :company_id, presence: true
  attachment :venue_image
  attachment :banner_image

  belongs_to :company
  has_many :theaters
  has_many :theater_metadata, through: :theaters
  accepts_nested_attributes_for :theaters
  has_many :showtimes, through: :theaters
  accepts_nested_attributes_for :showtimes

  private

  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end

  def search_data
    {
        id: id,
        name: name,
        image: Refile.attachment_url(self, :venue_image, :fill, 50, 50, format: 'jpg'),
    }
  end
end

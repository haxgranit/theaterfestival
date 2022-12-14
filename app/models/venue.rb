class Venue < ActiveRecord::Base
  acts_as_mappable auto_geocode: { field: :address, error_message: 'Error geocoding' }
  include Permissible
  include HasAlbum
  include SocialTarget
  include PublicActivity::Common
  searchkick word_start: [:name], searchable: [:name]
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
        path: "/venues/#{id}",
        image: Refile.attachment_url(self, :venue_image, :fill, 50, 50, format: 'jpg') || ActionController::Base.helpers.asset_url('unknown50x50.png'),
    }
  end
end

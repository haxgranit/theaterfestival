class Festival < ActiveRecord::Base
  cattr_accessor :form_steps do
    %w(timing festival_title company festival_shows festival_data festival_showtimes festival_people festival_info festival_staff)
  end

  attr_accessor :form_step

  include Permissible
  include HasAlbum
  include SocialTarget
  include PublicActivity::Common
  searchkick word_start: [:title], searchable: [:title], locations: ["location"]
  attachment :festival_image
  attachment :banner_image

  belongs_to :company
  has_many :companies, through: :company_festival_links
  has_many :productions, through: :festival_production_links
  has_many :showtimes, through: :productions
  accepts_nested_attributes_for :productions
  has_many :company_festival_links
  has_many :festival_production_links
  accepts_nested_attributes_for :festival_production_links

  has_many :credits, as: :creditable
  accepts_nested_attributes_for :credits

  alias_attribute :name, :title

  def location
    if showtimes.present? && showtimes.first.venue.present?
      venue = showtimes.first.venue
      [venue.lat, venue.lng]
    else
      []
    end
  end

  def future_shows?
    showtimes.select { |s| s.showtime > DateTime.now }.present?
  end


  def search_data
    {
      id: id,
      title: title,
      subtitle: subtitle,
      location: location,
      upcoming: {
        someday: future_shows?
      }
    }
  end

end

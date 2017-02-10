class Production < ActiveRecord::Base

  cattr_accessor :form_steps do
    %w(timing production_title company production_data production_dates production_info production_people production_cast production_creative production_coproducers production_other production_showtimes)
  end

  attr_accessor :form_step

  include Permissible
  include Metadata
  include SocialTarget
  include HasAlbum
  include PublicActivity::Model
  tracked
  paginates_per 9

  searchkick word_start: [:title], searchable: [:title], locations: ["location"]

  attachment :key_image
  attachment :banner_image


  belongs_to :company
  has_many :artists, through: :credits
  has_many :companies, through: :company_production_links
  has_many :company_production_links
  has_many :credits, as: :creditable
  has_many :festival_production_links
  has_many :festivals, through: :festival_production_links
  has_many :press_items
  has_many :production_showtime_links
  has_many :reviews
  has_many :showtimes
  has_many :theaters, through: :showtimes
  has_many :venues, through: :theaters
  has_one :production_metadata

  accepts_nested_attributes_for :company_production_links
  accepts_nested_attributes_for :credits
  accepts_nested_attributes_for :festival_production_links
  accepts_nested_attributes_for :production_metadata, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :reviews
  accepts_nested_attributes_for :showtimes
  accepts_nested_attributes_for :theaters
  accepts_nested_attributes_for :venues

  #scope :upcoming, -> { joins(:showtimes).where 'showtimes.showtime > ?', DateTime.now }
  scope :search_import, -> { includes(:festivals) }

  alias_attribute :name, :title

  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?

    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end

  def location
    if showtimes.present? && showtimes.first.venue.present?
      venue = showtimes.first.venue
      [venue.lat, venue.lng]
    else
      []
    end
  end

  def future_shows?
    showtimes.select { |s| s.date > Date.today }.present?
  end

  def closing_soon?
    if last_performance.present?
      last_performance <= 7.days.from_now
    else
      false
    end
  end

  def tomorrow?
    showtimes.select { |s| s.tomorrow? }.present?
  end

  def today?
    showtimes.select { |s| s.today? }.present?
  end

  def this_weekend?
    showtimes.select { |s| s.weekend? }.present?
  end

  def broadway?
    showtimes.select { |s| s.broadway? }.present?
  end

  def offbroadway?
    showtimes.select { |s| s.offbroadway? }.present?
  end

  def black_box?
    showtimes.select { |s| s.black_box? }.present?
  end

  def guaranteed_price?
    showtimes.select { |s| s.ticketing.try(:fetch, 'guaranteed_price') }.present?
  end

  def metadata
    collect_metadata(production_metadata) end

  def showtime_json
    results = []
    result_times = []
    showtimes.group_by(&:theater).each do |theater, times|
      v = theater.venue

      times.each do |t|
        result_times << {
          date: t.date,
          time: t.time,
          guaranteed_price: t.ticketing.try(:fetch, 'guaranteed_price')
        }
      end

      results << {
        venue: { id: v.id,
                 address: v.address,
                 city: v.city,
                 state: v.state,
                 zip: v.zip},
        theater: theater.id,
        times: result_times
      }
    end
    results.as_json
  end

  def search_data
    {
      id: id,
      path: "/productions/#{id}",
      title: title,
      name: title,
      image: Refile.attachment_url(self, :key_image, :fill, 50, 75, format: 'jpg') || ActionController::Base.helpers.asset_url('unknown50x50.png'),
      likes: self.likers(User).count,
      company: company.try(:name),
      closing_soon: closing_soon?,
      location: location,
      festivals: festivals,
      upcoming: {
        today: today?,
        tomorrow: tomorrow?,
        weekend: this_weekend?,
        someday: future_shows?
      },
      size: {
        broadway: broadway?,
        offbroadway: offbroadway?,
        black_box: black_box?
      },
      guaranteed_price: guaranteed_price?,
      showtimes: showtime_json
    }
  end
end

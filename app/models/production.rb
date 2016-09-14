class Production < ActiveRecord::Base
  include Permissible
  include Metadata
  include SocialTarget
  include HasAlbum
  include PublicActivity::Model
  tracked
  paginates_per 9

  searchkick word_start: [:title], searchable: [:title]

  validates :title, :first_performance, presence: true
  attachment :key_image
  attachment :banner_image

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
  accepts_nested_attributes_for :reviews
  has_many :showtimes
  accepts_nested_attributes_for :showtimes
  has_many :theaters, through: :showtimes
  has_many :venues, through: :theaters
  has_many :production_showtime_links
  has_one :production_metadata
  accepts_nested_attributes_for :production_metadata, reject_if: :all_blank, allow_destroy: true

  alias_attribute :name, :title

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
    showtimes.select { |s| s.ticketing.fetch('guaranteed_price') }.present?
  end

  def metadata
    collect_metadata(production_metadata)
  end

  def showtime_json
    results = []
    result_times = []
    showtimes.group_by(&:theater).each do |theater, times|
      v = theater.venue

      times.each do |t|
        result_times << {
          time: t.showtime.in_time_zone(v.time_zone),
          guaranteed_price: t.ticketing.fetch('guaranteed_price')
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
      title: title,
      company: company.try(:name),
      upcoming: {
        today: today?,
        tomorrow: tomorrow?,
        weekend: this_weekend?
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

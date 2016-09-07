class Showtime < ActiveRecord::Base
  validates :showtime, :theater_id, presence: true
  validates_uniqueness_of :showtime, scope: [:theater_id]

  belongs_to :theater
  has_one :production_showtime_link
  has_one :production, through: :production_showtime_link
  has_one :venue, through: :theater
  has_one :showtime_ticket_metadata
  has_one :showtime_accessibility_metadata

  def local_time
    showtime.in_time_zone(venue.time_zone)
  end

  def tomorrow?
    showtime.to_date == Date.tomorrow
  end

  def today?
    showtime.to_date == Date.today
  end

  def weekend?
    this_sunday = Date.today.sunday
    weekend = [this_sunday, this_sunday - 1.day, this_sunday - 2.days]
    weekend.include? showtime.to_date
  end

  def accessibility
    # Showtime-specific accessibility info overrides theater-specific info
    s = showtime_accessibility_metadata.try(:attributes).try(:compact)
    t = theater.theater_metadata.try(:attributes)
    s.try(:reverse_merge!, t)
  end

  def broadway?
    accessibility.try(:[], 'seat_capacity').try(:>=, 500)
  end

  def offbroadway?
    accessibility.try(:[], 'seat_capacity').try(:between?, 100, 499)
  end

  def black_box?
    accessibility.try(:[], 'seat_capacity').try(:<, 100)
  end

end

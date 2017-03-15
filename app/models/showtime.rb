class Showtime < ActiveRecord::Base
  validates :time, :date, presence: true

  belongs_to :theater
  belongs_to :production
  has_one :venue, through: :theater
  has_one :showtime_ticket_metadata, dependent: :destroy
  has_one :showtime_accessibility_metadata, dependent: :destroy
  has_many :additional_ticket_types, dependent: :destroy
  accepts_nested_attributes_for :venue
  accepts_nested_attributes_for :theater
  accepts_nested_attributes_for :showtime_ticket_metadata
  accepts_nested_attributes_for :showtime_accessibility_metadata
  accepts_nested_attributes_for :additional_ticket_types, reject_if: :all_blank, allow_destroy: true

  # def local_time
  #   showtime.in_time_zone(venue.time_zone)
  # end

  def previous
    self.class.where('id < ?', id).where('production_id = ?', production_id).last
  end

  def tomorrow?
    self.date == Date.tomorrow
  end

  def today?
    self.date == Date.today
  end

  def weekend?
    this_sunday = Date.today.sunday
    weekend = [this_sunday, this_sunday - 1.day, this_sunday - 2.days]
    weekend.include? date
  end

  def accessibility
    # Showtime-specific accessibility info overrides theater-specific info
    if showtime_accessibility_metadata.present?
      s = showtime_accessibility_metadata.try(:attributes).try(:compact)
    end
    if theater.present?
      t = theater.try(:theater_metadata).try(:attributes)
    end
    if s.present? && t.present?
      s.try(:reverse_merge, t)
    elsif s.blank? && t.present?
      t
    else
      nil
    end
  end

  def ticketing
    showtime_ticket_metadata.try(:attributes).try(:compact)
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

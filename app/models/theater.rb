class Theater < ActiveRecord::Base
  validates :name, :venue_id, presence: true
  validates_uniqueness_of :name, scope: [:venue_id]

  belongs_to :venue
  has_many :showtimes
  has_many :showtime_accessibility_metadata, through: :showtimes
  has_one :theater_metadata
  accepts_nested_attributes_for :theater_metadata

  def metadata
    if theater_metadata
      theater_metadata
        .attributes
        .except('id', 'theater_id', 'created_at', 'updated_at')
        .delete_if { |_, v| v.blank? }
    end
  end
end

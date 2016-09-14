class Theater < ActiveRecord::Base
  include Permissible
  include Metadata
  include PublicActivity::Common
  searchkick word_start: [:name], searchable: [:name]
  validates :name, :venue_id, presence: true
  validates_uniqueness_of :name, scope: [:venue_id]

  belongs_to :venue
  has_many :showtimes
  has_many :showtime_accessibility_metadata, through: :showtimes
  has_one :theater_metadata
  accepts_nested_attributes_for :theater_metadata

  def metadata
    collect_metadata(theater_metadata)
  end

end

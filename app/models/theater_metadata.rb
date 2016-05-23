class TheaterMetadata < ActiveRecord::Base
  validates :theater_id, presence: true;
  validates_uniqueness_of :theater_id
  belongs_to :theater
end

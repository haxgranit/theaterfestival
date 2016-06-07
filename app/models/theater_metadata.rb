class TheaterMetadata < ActiveRecord::Base
  validates_uniqueness_of :theater_id
  belongs_to :theater
end

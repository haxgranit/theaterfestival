class FestivalProductionLink < ActiveRecord::Base
  validates_uniqueness_of :festival_id, scope: [:production_id]
  belongs_to :festival
  belongs_to :production
end

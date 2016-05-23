class ProductionMetadata < ActiveRecord::Base
  validates_uniqueness_of :production_id
  belongs_to :production
end

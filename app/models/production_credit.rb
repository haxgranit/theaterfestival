class ProductionCredit < ActiveRecord::Base
  belongs_to :artist
  belongs_to :production
end

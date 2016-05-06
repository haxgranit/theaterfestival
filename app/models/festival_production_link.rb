class FestivalProductionLink < ActiveRecord::Base
  belongs_to :festival
  belongs_to :production
end

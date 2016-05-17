class CompanyProductionLink < ActiveRecord::Base
  belongs_to :company
  belongs_to :production
end

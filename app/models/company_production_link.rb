class CompanyProductionLink < ActiveRecord::Base
  validates_uniqueness_of :company_id, scope: [:production_id]
  belongs_to :company
  belongs_to :production
end

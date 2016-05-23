class CompanySocialMetadata < ActiveRecord::Base
  validates_uniqueness_of :company_id
  belongs_to :company
end

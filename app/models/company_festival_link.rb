class CompanyFestivalLink < ActiveRecord::Base
  validates_uniqueness_of :company_id, scope: [:festival_id]

  belongs_to :company
  belongs_to :festival
end

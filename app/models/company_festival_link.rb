class CompanyFestivalLink < ActiveRecord::Base
  belongs_to :company
  belongs_to :festival
end

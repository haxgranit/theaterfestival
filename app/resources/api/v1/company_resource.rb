class Api::V1::CompanyResource < JSONAPI::Resource
  has_one :user
  has_many :venues
  has_many :productions
  attributes :name, :website, :description, :email
end

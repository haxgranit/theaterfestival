class Api::V1::ProductionResource < JSONAPI::Resource
  has_one :company
  has_many :showtimes
  attributes :title, :tagline, :description, :first_performance, :last_performance
end

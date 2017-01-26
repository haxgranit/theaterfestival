class Api::V1::TheaterResource < JSONAPI::Resource
  has_one :venue
  has_many :showtimes
  attribute :name

  filter :name
end

class Api::V1::VenueResource < JSONAPI::Resource
  has_one :company
  has_many :theaters
  attributes :name, :website, :phone_number, :description, :time_zone, :address, :city, :state, :zip
end

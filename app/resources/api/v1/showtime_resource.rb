class Api::V1::ShowtimeResource < JSONAPI::Resource
  has_one :theater
  has_one :production
  attribute :showtime
end

class Api::V1::ArtistResource < JSONAPI::Resource
  has_one :user
  attributes :stage_name, :title, :birthdate, :hometown, :education, :full_bio
end

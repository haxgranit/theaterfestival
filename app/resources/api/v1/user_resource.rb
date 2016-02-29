class Api::V1::UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :email, :password, :time_zone

  def fetchable_fields
    super - [:password, :time_zone]
  end
end

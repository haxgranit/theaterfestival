require "administrate/base_dashboard"

class ArtistDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    artist_social_metadata: Field::HasOne,
    credits: Field::HasMany,
    productions: Field::HasMany,
    pictures: Field::HasMany,
    id: Field::Number,
    first_name: Field::Text,
    last_name: Field::Text,
    title: Field::Text,
    birthdate: Field::DateTime,
    birth_location: Field::Text,
    hometown: Field::Text,
    education: Field::Text,
    full_bio: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    profile_image_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :artist_social_metadata,
    :credits,
    :productions,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :artist_social_metadata,
    :credits,
    :productions,
    :pictures,
    :id,
    :first_name,
    :last_name,
    :title,
    :birthdate,
    :birth_location,
    :hometown,
    :education,
    :full_bio,
    :created_at,
    :updated_at,
    :profile_image_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :artist_social_metadata,
    :credits,
    :productions,
    :pictures,
    :first_name,
    :last_name,
    :title,
    :birthdate,
    :birth_location,
    :hometown,
    :education,
    :full_bio,
    :profile_image_id,
  ].freeze

  # Overwrite this method to customize how artists are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(artist)
  #   "Artist ##{artist.id}"
  # end
end

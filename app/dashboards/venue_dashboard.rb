require "administrate/base_dashboard"

class VenueDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    permissions: Field::HasMany,
    albums: Field::HasMany.with_options(class_name: "PhotoAlbum"),
    photos: Field::HasMany,
    company: Field::BelongsTo,
    theaters: Field::HasMany,
    theater_metadata: Field::HasMany,
    showtimes: Field::HasMany,
    id: Field::Number,
    name: Field::Text,
    website: Field::Text,
    phone_number: Field::Text,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    time_zone: Field::Text,
    address: Field::Text,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    lat: Field::Number.with_options(decimals: 2),
    lng: Field::Number.with_options(decimals: 2),
    banner_image_id: Field::String,
    venue_image_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :theaters,
    :showtimes,
    :company
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :permissions,
    :albums,
    :photos,
    :company,
    :theaters,
    :theater_metadata,
    :showtimes,
    :id,
    :name,
    :website,
    :phone_number,
    :description,
    :created_at,
    :updated_at,
    :time_zone,
    :address,
    :city,
    :state,
    :zip,
    :lat,
    :lng,
    :banner_image_id,
    :venue_image_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :permissions,
    :albums,
    :photos,
    :company,
    :theaters,
    :theater_metadata,
    :showtimes,
    :name,
    :website,
    :phone_number,
    :description,
    :time_zone,
    :address,
    :city,
    :state,
    :zip,
    :lat,
    :lng,
    :banner_image_id,
    :venue_image_id,
  ].freeze

  # Overwrite this method to customize how venues are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(venue)
    "#{venue.name}"
  end
end

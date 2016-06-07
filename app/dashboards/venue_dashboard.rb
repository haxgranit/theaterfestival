require "administrate/base_dashboard"

class VenueDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    company: Field::BelongsTo,
    theaters: Field::HasMany,
    showtimes: Field::HasMany,
    id: Field::Number,
    name: Field::Text,
    address1: Field::Text,
    address2: Field::Text,
    website: Field::Text,
    phone_number: Field::Text,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    time_zone: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :company,
    :theaters,
    :showtimes,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :company,
    :theaters,
    :showtimes,
    :id,
    :name,
    :address1,
    :address2,
    :website,
    :phone_number,
    :description,
    :created_at,
    :updated_at,
    :time_zone,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :company,
    :theaters,
    :showtimes,
    :name,
    :address1,
    :address2,
    :website,
    :phone_number,
    :description,
    :time_zone,
  ].freeze

  # Overwrite this method to customize how venues are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(venue)
  #   "Venue ##{venue.id}"
  # end
end

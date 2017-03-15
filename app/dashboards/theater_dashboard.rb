require "administrate/base_dashboard"

class TheaterDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    permissions: Field::HasMany,
    venue: Field::BelongsTo,
    showtimes: Field::HasMany,
    showtime_accessibility_metadata: Field::HasMany,
    theater_metadata: Field::HasOne,
    id: Field::Number,
    name: Field::Text,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :venue,
    :showtimes,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :permissions,
    :venue,
    :showtimes,
    :showtime_accessibility_metadata,
    :theater_metadata,
    :id,
    :name,
    :description,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :permissions,
    :venue,
    :showtimes,
    :showtime_accessibility_metadata,
    :theater_metadata,
    :name,
    :description,
  ].freeze

  # Overwrite this method to customize how theaters are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(theater)
    "#{theater.name}"
  end
end

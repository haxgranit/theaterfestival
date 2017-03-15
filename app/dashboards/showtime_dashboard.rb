require "administrate/base_dashboard"

class ShowtimeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    theater: Field::BelongsTo,
    production: Field::BelongsTo,
    venue: Field::HasOne,
    showtime_ticket_metadata: Field::HasOne,
    showtime_accessibility_metadata: Field::HasOne,
    id: Field::Number,
    showtime: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    date: Field::DateTime,
    time: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :theater,
    :production,
    :venue,
    :showtime_ticket_metadata,
    :showtime_accessibility_metadata
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :theater,
    :production,
    :venue,
    :showtime_ticket_metadata,
    :showtime_accessibility_metadata,
    :id,
    :showtime,
    :created_at,
    :updated_at,
    :date,
    :time,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :theater,
    :production,
    :venue,
    :showtime_ticket_metadata,
    :showtime_accessibility_metadata,
    :showtime,
    :date,
    :time,
  ].freeze

  # Overwrite this method to customize how showtimes are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(showtime)
    "#{showtime.date} - #{showtime.time}"
  end
end

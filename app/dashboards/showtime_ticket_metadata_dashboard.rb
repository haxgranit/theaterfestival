require "administrate/base_dashboard"

class ShowtimeTicketMetadataDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    showtime: Field::BelongsTo,
    id: Field::Number,
    guaranteed_price: Field::String.with_options(searchable: false),
    guaranteed_price_note: Field::Text,
    ticket_link: Field::Text,
    reservation_link: Field::Text,
    reservation_link_info: Field::Text,
    reservation_phone: Field::Text,
    reservation_phone_info: Field::Text,
    in_person_ticketing_info: Field::Text,
    special_event: Field::Text,
    special_event_info: Field::Text,
    additional_ticket_type: Field::Text,
    additional_ticket_type_price: Field::String.with_options(searchable: false),
    additional_ticket_type_info: Field::Text,
    notes: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :showtime,
    :id,
    :guaranteed_price,
    :guaranteed_price_note,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :showtime,
    :id,
    :guaranteed_price,
    :guaranteed_price_note,
    :ticket_link,
    :reservation_link,
    :reservation_link_info,
    :reservation_phone,
    :reservation_phone_info,
    :in_person_ticketing_info,
    :special_event,
    :special_event_info,
    :additional_ticket_type,
    :additional_ticket_type_price,
    :additional_ticket_type_info,
    :notes,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :showtime,
    :guaranteed_price,
    :guaranteed_price_note,
    :ticket_link,
    :reservation_link,
    :reservation_link_info,
    :reservation_phone,
    :reservation_phone_info,
    :in_person_ticketing_info,
    :special_event,
    :special_event_info,
    :additional_ticket_type,
    :additional_ticket_type_price,
    :additional_ticket_type_info,
    :notes,
  ].freeze

  # Overwrite this method to customize how showtime ticket metadata are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(showtime_ticket_metadata)
  #   "ShowtimeTicketMetadata ##{showtime_ticket_metadata.id}"
  # end
end

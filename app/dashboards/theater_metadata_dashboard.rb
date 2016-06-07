require "administrate/base_dashboard"

class TheaterMetadataDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    theater: Field::BelongsTo,
    id: Field::Number,
    seat_capacity: Field::Number,
    hearing_devices: Field::Boolean,
    hearing_devices_info: Field::Text,
    translation_devices: Field::Boolean,
    translation_devices_info: Field::Text,
    wheelchair_accessible: Field::Boolean,
    wheelchair_accessible_info: Field::Text,
    guide_dogs: Field::Boolean,
    guide_dogs_info: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :theater,
    :id,
    :seat_capacity,
    :hearing_devices,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :theater,
    :id,
    :seat_capacity,
    :hearing_devices,
    :hearing_devices_info,
    :translation_devices,
    :translation_devices_info,
    :wheelchair_accessible,
    :wheelchair_accessible_info,
    :guide_dogs,
    :guide_dogs_info,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :theater,
    :seat_capacity,
    :hearing_devices,
    :hearing_devices_info,
    :translation_devices,
    :translation_devices_info,
    :wheelchair_accessible,
    :wheelchair_accessible_info,
    :guide_dogs,
    :guide_dogs_info,
  ].freeze

  # Overwrite this method to customize how theater metadata are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(theater_metadata)
  #   "TheaterMetadata ##{theater_metadata.id}"
  # end
end

require "administrate/base_dashboard"

class ProductionMetadataDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    production: Field::BelongsTo,
    id: Field::Number,
    performance_type: Field::Text,
    info_heading: Field::Text,
    info: Field::Text,
    warnings: Field::Text,
    warning_info: Field::Text,
    running_time: Field::Text,
    intermissions: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    recommended_age: Field::Text,
    website: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :production,
    :id,
    :performance_type,
    :info_heading,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :production,
    :id,
    :performance_type,
    :info_heading,
    :info,
    :warnings,
    :warning_info,
    :running_time,
    :intermissions,
    :created_at,
    :updated_at,
    :recommended_age,
    :website,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :production,
    :performance_type,
    :info_heading,
    :info,
    :warnings,
    :warning_info,
    :running_time,
    :intermissions,
    :recommended_age,
    :website,
  ].freeze

  # Overwrite this method to customize how production metadata are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(production_metadata)
  #   "ProductionMetadata ##{production_metadata.id}"
  # end
end

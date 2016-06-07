require "administrate/base_dashboard"

class WritingCreditDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    artist: Field::BelongsTo,
    production: Field::BelongsTo,
    id: Field::Number,
    name: Field::Text,
    position: Field::Text,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    confirmed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :artist,
    :production,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :artist,
    :production,
    :id,
    :name,
    :position,
    :start_date,
    :end_date,
    :confirmed,
    :created_at,
    :updated_at,
    :type,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :artist,
    :production,
    :name,
    :position,
    :start_date,
    :end_date,
    :confirmed,
    :type,
  ].freeze

  # Overwrite this method to customize how writing credits are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(writing_credit)
  #   "WritingCredit ##{writing_credit.id}"
  # end
end

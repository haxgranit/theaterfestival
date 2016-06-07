require "administrate/base_dashboard"

class PressItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    production: Field::BelongsTo,
    id: Field::Number,
    date: Field::DateTime,
    publication: Field::Text,
    quote: Field::Text,
    author: Field::Text,
    link: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :production,
    :id,
    :date,
    :publication,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :production,
    :id,
    :date,
    :publication,
    :quote,
    :author,
    :link,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :production,
    :date,
    :publication,
    :quote,
    :author,
    :link,
  ].freeze

  # Overwrite this method to customize how press items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(press_item)
  #   "PressItem ##{press_item.id}"
  # end
end

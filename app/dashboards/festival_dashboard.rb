require "administrate/base_dashboard"

class FestivalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    companies: Field::HasMany,
    productions: Field::HasMany,
    company_festival_links: Field::HasMany,
    festival_production_links: Field::HasMany,
    id: Field::Number,
    title: Field::Text,
    subtitle: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :companies,
    :productions,
    :company_festival_links,
    :festival_production_links,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :companies,
    :productions,
    :company_festival_links,
    :festival_production_links,
    :id,
    :title,
    :subtitle,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :companies,
    :productions,
    :company_festival_links,
    :festival_production_links,
    :title,
    :subtitle,
  ].freeze

  # Overwrite this method to customize how festivals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(festival)
  #   "Festival ##{festival.id}"
  # end
end

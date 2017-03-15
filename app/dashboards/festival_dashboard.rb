require "administrate/base_dashboard"

class FestivalDashboard < Administrate::BaseDashboard
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
    companies: Field::HasMany,
    festival_production_links: Field::HasMany,
    productions: Field::HasMany,
    showtimes: Field::HasMany,
    company_festival_links: Field::HasMany,
    credits: Field::HasMany,
    id: Field::Number,
    title: Field::Text,
    subtitle: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    banner_image_id: Field::String,
    festival_image_id: Field::String,
    archived: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :subtitle,
    :company,
    :companies,
    :productions
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :permissions,
    :albums,
    :photos,
    :company,
    :companies,
    :festival_production_links,
    :productions,
    :showtimes,
    :company_festival_links,
    :credits,
    :id,
    :title,
    :subtitle,
    :created_at,
    :updated_at,
    :banner_image_id,
    :festival_image_id,
    :archived,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :permissions,
    :albums,
    :photos,
    :company,
    :companies,
    :festival_production_links,
    :productions,
    :showtimes,
    :company_festival_links,
    :credits,
    :title,
    :subtitle,
    :banner_image_id,
    :festival_image_id,
    :archived,
  ].freeze

  # Overwrite this method to customize how festivals are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(festival)
    "#{festival.title}"
  end
end

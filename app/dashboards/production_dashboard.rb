require "administrate/base_dashboard"

class ProductionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    credits: Field::HasMany,
    artists: Field::HasMany,
    companies: Field::HasMany,
    company_production_links: Field::HasMany,
    festivals: Field::HasMany,
    festival_production_links: Field::HasMany,
    press_items: Field::HasMany,
    reviews: Field::HasMany,
    showtimes: Field::HasMany,
    production_showtime_links: Field::HasMany,
    production_metadata: Field::HasOne,
    id: Field::Number,
    title: Field::Text,
    public: Field::Boolean,
    tagline: Field::Text,
    description: Field::Text,
    first_performance: Field::DateTime,
    last_performance: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    key_image_id: Field::String,
    key_image_credit: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :credits,
    :artists,
    :companies,
    :company_production_links,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :credits,
    :artists,
    :companies,
    :company_production_links,
    :festivals,
    :festival_production_links,
    :press_items,
    :reviews,
    :showtimes,
    :production_showtime_links,
    :production_metadata,
    :id,
    :title,
    :public,
    :tagline,
    :description,
    :first_performance,
    :last_performance,
    :created_at,
    :updated_at,
    :key_image_id,
    :key_image_credit,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :credits,
    :artists,
    :companies,
    :company_production_links,
    :festivals,
    :festival_production_links,
    :press_items,
    :reviews,
    :showtimes,
    :production_showtime_links,
    :production_metadata,
    :title,
    :public,
    :tagline,
    :description,
    :first_performance,
    :last_performance,
    :key_image_id,
    :key_image_credit,
  ].freeze

  # Overwrite this method to customize how productions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(production)
  #   "Production ##{production.id}"
  # end
end

require "administrate/base_dashboard"

class CompanyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    company_festival_links: Field::HasMany,
    festivals: Field::HasMany,
    festival_production_links: Field::HasMany,
    productions: Field::HasMany,
    company_production_links: Field::HasMany,
    venues: Field::HasMany,
    theaters: Field::HasMany,
    showtimes: Field::HasMany,
    company_metadata: Field::HasOne,
    company_social_metadata: Field::HasOne,
    id: Field::Number,
    name: Field::Text,
    company_type: Field::Text,
    website: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
    email: Field::Text,
    company_image_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :company_festival_links,
    :festivals,
    :festival_production_links,
    :productions,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :company_festival_links,
    :festivals,
    :festival_production_links,
    :productions,
    :company_production_links,
    :venues,
    :theaters,
    :showtimes,
    :company_metadata,
    :company_social_metadata,
    :id,
    :name,
    :company_type,
    :website,
    :created_at,
    :updated_at,
    :description,
    :email,
    :company_image_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :company_festival_links,
    :festivals,
    :festival_production_links,
    :productions,
    :company_production_links,
    :venues,
    :theaters,
    :showtimes,
    :company_metadata,
    :company_social_metadata,
    :name,
    :company_type,
    :website,
    :description,
    :email,
    :company_image_id,
  ].freeze

  # Overwrite this method to customize how companies are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(company)
  #   "Company ##{company.id}"
  # end
end

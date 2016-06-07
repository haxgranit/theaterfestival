require "administrate/base_dashboard"

class CompanySocialMetadataDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    company: Field::BelongsTo,
    id: Field::Number,
    twitter: Field::Text,
    facebook: Field::Text,
    linkedin: Field::Text,
    tumblr: Field::Text,
    vine: Field::Text,
    snapchat: Field::Text,
    instagram: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :company,
    :id,
    :twitter,
    :facebook,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :company,
    :id,
    :twitter,
    :facebook,
    :linkedin,
    :tumblr,
    :vine,
    :snapchat,
    :instagram,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :company,
    :twitter,
    :facebook,
    :linkedin,
    :tumblr,
    :vine,
    :snapchat,
    :instagram,
  ].freeze

  # Overwrite this method to customize how company social metadata are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(company_social_metadata)
  #   "CompanySocialMetadata ##{company_social_metadata.id}"
  # end
end

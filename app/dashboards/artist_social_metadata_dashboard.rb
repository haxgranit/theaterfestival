require "administrate/base_dashboard"

class ArtistSocialMetadataDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    artist: Field::BelongsTo,
    id: Field::Number,
    twitter: Field::Text,
    facebook: Field::Text,
    linkedin: Field::Text,
    tumblr: Field::Text,
    imdb: Field::Text,
    email: Field::Text,
    website: Field::Text,
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
    :artist,
    :id,
    :twitter,
    :facebook,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :artist,
    :id,
    :twitter,
    :facebook,
    :linkedin,
    :tumblr,
    :imdb,
    :email,
    :website,
    :instagram,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :artist,
    :twitter,
    :facebook,
    :linkedin,
    :tumblr,
    :imdb,
    :email,
    :website,
    :instagram,
  ].freeze

  # Overwrite this method to customize how artist social metadata are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(artist_social_metadata)
  #   "ArtistSocialMetadata ##{artist_social_metadata.id}"
  # end
end

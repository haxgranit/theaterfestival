require "administrate/base_dashboard"

class PhotoAlbumDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    has_album: Field::Polymorphic,
    photos: Field::HasMany,
    activities: Field::HasMany.with_options(class_name: "::PublicActivity::Activity"),
    id: Field::Number,
    title: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :has_album,
    :photos,
    :activities,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :has_album,
    :photos,
    :activities,
    :id,
    :title,
    :description,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :has_album,
    :photos,
    :activities,
    :title,
    :description,
  ].freeze

  # Overwrite this method to customize how photo albums are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(photo_album)
  #   "PhotoAlbum ##{photo_album.id}"
  # end
end

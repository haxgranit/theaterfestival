require "administrate/base_dashboard"

class PhotoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    photo_album: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    description: Field::String,
    credit: Field::String,
    photo_date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    photo_id: Field::String,
    photo_filename: Field::String,
    photo_size: Field::Number,
    photo_content_type: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :photo_album,
    :id,
    :title,
    :description,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :photo_album,
    :id,
    :title,
    :description,
    :credit,
    :photo_date,
    :created_at,
    :updated_at,
    :photo_id,
    :photo_filename,
    :photo_size,
    :photo_content_type,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :photo_album,
    :title,
    :description,
    :credit,
    :photo_date,
    :photo_id,
    :photo_filename,
    :photo_size,
    :photo_content_type,
  ].freeze

  # Overwrite this method to customize how photos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(photo)
  #   "Photo ##{photo.id}"
  # end
end

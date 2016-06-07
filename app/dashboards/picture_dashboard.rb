require "administrate/base_dashboard"

class PictureDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    has_image: Field::Polymorphic,
    id: Field::Number,
    title: Field::String,
    credit: Field::String,
    image_id: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :has_image,
    :id,
    :title,
    :credit,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :has_image,
    :id,
    :title,
    :credit,
    :image_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :has_image,
    :title,
    :credit,
    :image_id,
  ].freeze

  # Overwrite this method to customize how pictures are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(picture)
  #   "Picture ##{picture.id}"
  # end
end

require "administrate/base_dashboard"

class CreditDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    activities: Field::HasMany.with_options(class_name: "::PublicActivity::Activity"),
    artist: Field::BelongsTo,
    creditable: Field::Polymorphic,
    id: Field::Number,
    credited_as: Field::String,
    position: Field::String,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    original_cast: Field::Boolean,
    confirmed: Field::Boolean,
    credit_type: Field::String.with_options(searchable: false),
    key_credit: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :activities,
    :artist,
    :creditable,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :activities,
    :artist,
    :creditable,
    :id,
    :credited_as,
    :position,
    :start_date,
    :end_date,
    :original_cast,
    :confirmed,
    :credit_type,
    :key_credit,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :activities,
    :artist,
    :creditable,
    :credited_as,
    :position,
    :start_date,
    :end_date,
    :original_cast,
    :confirmed,
    :credit_type,
    :key_credit,
  ].freeze

  # Overwrite this method to customize how credits are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(credit)
  #   "Credit ##{credit.id}"
  # end
end

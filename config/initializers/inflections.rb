# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.singular 'data', 'data'
  inflect.singular 'metadata', 'metadata'
  inflect.singular 'artist_social_metadata', 'artist_social_metadata'
  inflect.plural 'artist_social_metadata', 'artist_social_metadata'
  inflect.singular 'company_social_metadata', 'company_social_metadata'
  inflect.plural 'company_social_metadata', 'company_social_metadata'
  inflect.singular 'production_metadata', 'production_metadata'
  inflect.plural 'production_metadata', 'production_metadata'
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

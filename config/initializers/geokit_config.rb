Geokit::default_units = :miles # others :kms, :nms, :meters
Geokit::default_formula = :sphere
Geokit::Geocoders::provider_order=[:google]

Geokit::Geocoders::request_timeout = 10

# This is your Google Maps geocoder keys (all optional).
# See http://www.google.com/apis/maps/signup.html
# and http://www.google.com/apis/maps/documentation/#Geocoding_Examples
# Geokit::Geocoders::GoogleGeocoder.client_id = ''
# Geokit::Geocoders::GoogleGeocoder.cryptographic_key = ''
# Geokit::Geocoders::GoogleGeocoder.channel = ''

# You can also use the free API key instead of signed requests
# See https://developers.google.com/maps/documentation/geocoding/#api_key
Geokit::Geocoders::GoogleGeocoder.api_key = 'AIzaSyDmACqGGkmfy4tlImv6Etz7VLMKnKV0kK4'

# You can also set multiple API KEYS for different domains that may be directed
# to this same application.
# The domain from which the current user is being directed will automatically
# be updated for Geokit via
# the GeocoderControl class, which gets it's begin filter mixed
# into the ActionController.
# You define these keys with a Hash as follows:
# Geokit::Geocoders::google = {
# 'rubyonrails.org' => 'RUBY_ON_RAILS_API_KEY',
# ' ruby-docs.org' => 'RUBY_DOCS_API_KEY' }


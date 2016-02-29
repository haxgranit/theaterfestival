require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module TheaterEngineResources
  class Application < Rails::Application
    config.force_ssl = false
    config.active_record.timestamped_migrations = false
    config.time_zone = 'UTC'
    config.assets.enabled = true
    config.encoding = 'utf-8'
    config.active_support.escape_html_entities_in_json = true
    config.action_controller.perform_caching = true
    config.consider_all_requests_local       = false
    config.cache_store = :memcached_store
    config.active_record.raise_in_transactional_callbacks = true
  end
end

require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module TheaterEngineResources
  class Application < Rails::Application
    config.log_level = :debug
    config.log_tags  = [:subdomain, :uuid]

    config.cache_store = :redis_store, ENV['CACHE_URL'],
    { namespace: 'theaterengine::cache' }

    config.active_job.queue_adapter = :sidekiq

    config.force_ssl = false
    config.active_record.timestamped_migrations = false
    config.time_zone = 'UTC'
    config.assets.enabled = true
    config.encoding = 'utf-8'
    config.active_support.escape_html_entities_in_json = true
    config.action_controller.perform_caching = true
    config.consider_all_requests_local       = false
    config.active_record.raise_in_transactional_callbacks = true
  end
end

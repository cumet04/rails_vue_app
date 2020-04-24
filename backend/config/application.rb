require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module RailsVue
  class Application < Rails::Application
    config.load_defaults 6.0

    config.cache_classes = true
    config.eager_load = true
    config.consider_all_requests_local = false
    config.action_controller.perform_caching = true
    config.public_file_server.enabled = false

    config.log_level = :info
    config.log_tags = [ :request_id ]
    config.i18n.fallbacks = true

    config.active_support.deprecation = :notify
    config.log_formatter = ::Logger::Formatter.new

    config.active_record.dump_schema_after_migration = false
  end
end

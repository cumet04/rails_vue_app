Rails.application.configure do
  # rails config
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.public_file_server.enabled = true
  BetterErrors::Middleware.allow_ip! "0.0.0.0/0"

  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  config.log_level = :debug
  config.log_tags = []
  config.log_formatter = proc do |severity, datetime, progname, msg|
    time = datetime.strftime("%H:%M:%S:%L")
    "[#{severity}] #{time} : #{msg}\n"
  end

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_record.dump_schema_after_migration = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # middleware config
  config.session_options[:secure] = false
end

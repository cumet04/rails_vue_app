Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.public_file_server.enabled = true

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
end

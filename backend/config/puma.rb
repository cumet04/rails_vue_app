max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads_count = ENV.fetch("RAILS_MIN_THREADS", max_threads_count)
threads min_threads_count, max_threads_count

port 3000

environment ENV.fetch("RAILS_ENV")

pidfile "tmp/pids/server.pid"

concurrency = ENV.fetch("WEB_CONCURRENCY", 1)
if concurrency > 1
  workers concurrency
  preload_app!
end

plugin :tmp_restart

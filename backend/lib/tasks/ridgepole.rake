namespace :ridgepole do
  desc "Apply database schema"
  task apply: :environment do
    ridgepole("--apply", "--file #{schema_file}")

    if Rails.application.config.active_record.dump_schema_after_migration
      Rake::Task["db:schema:dump"].invoke
    end
    if Rails.env.development?
      Rake::Task["annotate_models"].invoke
    end
  end

  desc "Export database schema"
  task export: :environment do
    ridgepole("--export", "--output #{schema_file}")
  end

  desc "Display diff between database and schema"
  task diff: :environment do
    ridgepole("--diff #{config_file} #{schema_file}")
    exit($?.exitstatus)
  end

  private

  def schema_file
    Rails.root.join("db/Schemafile.rb") # with ".rb" for syntax highlight
  end

  def config_file
    Rails.root.join("config/database.yml")
  end

  def ridgepole(*options)
    command = [
      "bundle exec ridgepole",
      "--config #{config_file}",
      "-E #{Rails.env}",
    ]
    system [command + options].join(" ")
  end
end

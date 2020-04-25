module ApplicationHelper
  def assets_url(path)
    "#{Rails.application.config.assets_path}/#{path}"
  end
end

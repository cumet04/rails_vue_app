module ApplicationHelper
  def assets_url(path)
    "#{Rails.application.config.assets_path}/#{path}"
  end

  def prop_data_json
    raw(JSON.generate(@_view_props || {}))
  end
end

module ApplicationHelper
  def assets_url(path)
    "#{Rails.application.config.assets_path}/#{path}"
  end

  def view_uri
    key = "#{params[:controller]}##{params[:action]}"
    Rails.application.config._routing_map[key]
  end

  def prop_data_json
    raw(JSON.generate(@_view_props || {}))
  end
end

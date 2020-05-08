module ApplicationHelper
  def view_uri
    key = "#{params[:controller]}##{params[:action]}"
    Rails.application.config._routing_map[key]
  end

  def prop_data_json
    raw((@_view_props || {}).to_json)
  end
end

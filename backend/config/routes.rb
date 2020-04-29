Rails.application.routes.draw do
  root "home#index"

  get "login" => "session#new"
  post "login" => "session#create"
  delete "logout" => "session#destroy"

  resources :users

  get "*path" => "application#render_404"
end

# memonize routing map
Rails.application.config._routing_map =
  Rails.application.routes.routes
    .map { |r|
    ActionDispatch::Routing::RouteWrapper.new(r)
  }
    .reject(&:internal?)
    .to_h { |r|
    [
      r.endpoint,
      r.path.gsub("(.:format)", "").gsub(":", "_"),
    ]
  }

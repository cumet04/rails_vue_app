Rails.application.routes.draw do
  root "home#index"

  get "login" => "session#new"
  post "login" => "session#create"
  delete "logout" => "session#destroy"

  resource :users

  get "nested" => "nested#index"
  get "nested/some" => "nested#some"

  get "*path" => "application#render_404"
end

Rails.application.routes.draw do
  root "home#index"

  resource :users

  get "nested" => "nested#index"
  get "nested/some" => "nested#some"

  get "*path" => "application#render_404"
end

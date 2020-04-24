Rails.application.routes.draw do
  root "home#index"
  get "*path" => "application#render_404"
end

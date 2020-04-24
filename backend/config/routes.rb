Rails.application.routes.draw do
  get "*path" => "application#render_404"
end

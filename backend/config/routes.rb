Rails.application.routes.draw do
  scope format: false do
    root "home#index"

    get "login" => "session#new"
    post "login" => "session#create"
    delete "logout" => "session#destroy"

    scope :users do
      scope :current, as: :current_user do
        resource "", controller: :current_user,
                     only: [:edit, :show, :update, :destroy]
        scope :likes do
          post "posts/:id" => "current_user#add_like_post"
          delete "posts/:id" => "current_user#delete_like_post"
          post "comments/:id" => "current_user#add_like_comment"
          delete "comments/:id" => "current_user#delete_like_comment"
        end
      end

      resources "", as: :users, controller: :users,
                    only: [:index, :create, :new, :show]
    end

    resources :posts

    get "*path" => "application#render_404"
  end
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
      r.path.tr(":", "_"), # for path param
    # when using 'format: true' in routes, add 'remove("(.:format)")'
    ]
  }

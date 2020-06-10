class HomeController < ApplicationController
  def index
    view_props.merge!({
      posts: accessible(Post).map { |p| p.view_data(current_user) },
      users: accessible(User).map(&:view_data),
    })
  end
end

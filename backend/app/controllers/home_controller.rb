class HomeController < ApplicationController
  def index
    view_props.merge!({
      posts: accessible(Post).map(&:view_data),
      users: accessible(User).map(&:view_data),
    })
  end
end

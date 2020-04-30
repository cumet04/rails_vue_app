class HomeController < ApplicationController
  def index
    view_props.merge!({
      posts: Post.accessible_by(current_ability).map(&:view_data),
      users: User.accessible_by(current_ability).map(&:view_data),
    })
  end
end

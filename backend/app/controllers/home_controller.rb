class HomeController < ApplicationController
  def index
    set_prop_data(
      user: current_user&.then { |u| { email: u.email } },
      title: "hello world !",
    )
  end
end

class HomeController < ApplicationController
  def index
    set_prop_data(
      title: "hello world !",
    )
  end
end

class HomeController < ApplicationController
  def index
    set_prop_data(
      title: "hello world !",
    )
  end

  def create
    set_prop_data(
      title: params[:title],
    )
  end
end

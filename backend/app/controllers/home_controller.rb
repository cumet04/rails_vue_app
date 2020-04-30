class HomeController < ApplicationController
  def index
    view_props[:title] = "hello world!"
  end
end

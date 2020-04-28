class HomeController < ApplicationController
  def index
    page_props[:title] = "hello world!"
  end
end

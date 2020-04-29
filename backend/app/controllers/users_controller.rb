class UsersController < ApplicationController
  def new
  end

  def show
    page_props[:user] = ViewData::User.generate(User.find(params[:id]))
  end

  def create
    u = User.create!(email: params[:email], password: params[:password])
    warden.set_user(u)
    redirect_to root_path
  end
end

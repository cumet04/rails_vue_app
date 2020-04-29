class UsersController < ApplicationController
  def index
    page_props[:users] = User.all.map { |u| ViewData::User.generate(u) }
  end

  def create
    u = User.create!(email: params[:email], password: params[:password])
    warden.set_user(u)
    redirect_to root_path
  end

  def new
  end

  def show
    page_props[:user] = ViewData::User.generate(User.find(params[:id]))
  end
end

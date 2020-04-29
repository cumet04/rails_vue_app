class UsersController < ApplicationController
  def index
    page_props[:users] = User.available.map { |u| ViewData::User.generate(u) }
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

  def destroy
    u = User.find(params[:id])
    unless current_user == u
      head 400 and return
    end
    warden.logout
    u.delete!
    redirect_to root_path
  end
end

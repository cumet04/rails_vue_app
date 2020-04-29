class UsersController < ApplicationController
  def new
  end

  def show
    page_props[:user] = User.find(params[:id]).then { |u| { email: u.email } }
  end

  def create
    u = User.create!(email: params[:email], password: params[:password])
    warden.set_user(u)
    redirect_to root_path
  end
end

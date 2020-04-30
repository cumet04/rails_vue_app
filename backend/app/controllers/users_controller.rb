class UsersController < ApplicationController
  def index
    view_props[:users] = User.accessible_by(current_ability).map(&:view_data)
  end

  def create
    user = User.create!(email: params[:email], password: params[:password])
    warden.set_user(user)
    redirect_to root_path
  end

  def new
  end

  def show
    view_props[:user] = User.accessible_by(current_ability)
      .find(params[:id]).view_data
  end

  def destroy
    user = User.find(params[:id])
    authorize! :edit, user

    warden.logout
    user.delete!
    redirect_to root_path
  end
end

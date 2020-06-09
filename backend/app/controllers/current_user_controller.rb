class CurrentUserController < ApplicationController
  before_action do
    redirect_to login_path unless current_user
  end

  def show
    view_props[:user] = current_user.view_data
    view_props[:posts] = current_user.posts.map(&:view_data)
  end

  def edit
    view_props[:user] = editable_user.view_data
  end

  def update
    editable_user.update!(
      name: params[:name],
      biography: params[:biography],
    )
    redirect_to current_user_path
  end

  def destroy
    editable_user.delete!
    warden.logout
    redirect_to root_path
  end

  private

  def editable_user
    user = current_user
    authorize! :edit, user
    user
  end
end

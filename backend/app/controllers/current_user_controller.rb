class CurrentUserController < ApplicationController
  def show
    view_props[:user] = current_user.view_data
  end

  def edit
    view_props[:user] = editable_user
  end

  def update
    editable_user.update!(
      email: params[:email],
      password: params[:password],
      name: params[:name],
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

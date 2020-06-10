class CurrentUserController < ApplicationController
  before_action do
    redirect_to login_path unless current_user
  end

  def show
    u = current_user
    view_props[:user] = u.view_data
    view_props[:posts] = accessible(u.posts).map { |p| p.view_data(u) }
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

  def add_like_post
    editable_user.add_like!(Post.find(params[:id]))
    head 201
  end

  def delete_like_post
    editable_user.delete_like!(Post.find(params[:id]))
    head 202
  end

  def add_like_comment
    editable_user.add_like!(Comment.find(params[:id]))
    head 201
  end

  def delete_like_comment
    editable_user.delete_like!(Comment.find(params[:id]))
    head 202
  end

  private

  def editable_user
    user = current_user
    authorize! :edit, user
    user
  end
end

class PostsController < ApplicationController
  def index
    view_props[:posts] = Post.accessible_by(current_ability).map(&:view_data)
  end

  def create
    unless current_user
      head 400 and return
    end

    post = current_user.posts.create!(
      title: params[:title],
      content: params[:content],
    )
    redirect_to post_path(post)
  end

  def new
  end

  def edit
    post = Post.find(params[:id])
    authorize! :edit, post
    view_props[:post] = post
  end

  def update
    post = Post.find(params[:id])
    authorize! :edit, post

    post.update!(
      title: params[:title],
      content: params[:content],
    )
    redirect_to post_path(post)
  end

  def show
    view_props[:post] = Post.accessible_by(current_ability)
      .find(params[:id]).view_data
  end

  def destroy
    post = Post.find(params[:id])
    authorize! :edit, post

    post.delete!
    redirect_to posts_path
  end
end

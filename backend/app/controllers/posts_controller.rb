class PostsController < ApplicationController
  def index
    view_props[:posts] = Post.accessible_by(current_ability)
      .map { |p| ViewData::Post.generate(p) }
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

  def show
    view_props[:post] = ViewData::Post.generate(
      Post.accessible_by(current_ability).find(params[:id])
    )
  end

  def destroy
    post = Post.find(params[:id])
    authorize! :edit, post

    post.delete!
    redirect_to posts_path
  end
end

class PostsController < ApplicationController
  def index
    view_props[:posts] = accessible(Post).map(&:view_data)
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
    view_props[:post] = editable_post.view_data
  end

  def update
    post = editable_post
    post.update!(
      title: params[:title],
      content: params[:content],
    )
    redirect_to post_path(post)
  end

  def show
    view_props[:post] = accessible(Post).find(params[:id]).view_data
  end

  def destroy
    editable_post.delete!
    redirect_to posts_path
  end

  private

  def editable_post
    post = Post.find(params[:id])
    authorize! :edit, post
    post
  end
end

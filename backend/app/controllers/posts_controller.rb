class PostsController < ApplicationController
  def index
    page_props[:posts] = Post.available.map { |p| ViewData::Post.generate(p) }
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
    page_props[:post] = ViewData::Post.generate(Post.find(params[:id]))
  end

  def destroy
    post = Post.find(params[:id])
    unless post.author == current_user
      head 400 and return
    end

    post.delete!
    redirect_to posts_path
  end
end

class ViewData::Post < ViewData::Base
  attr_accessor :id, :title, :content, :author, :createdAt, :comments, :likedCount,
                :isLiked

  def self.generate(post, user = nil)
    self.new(
      id: post.id,
      title: post.title,
      content: post.content,
      author: post.author.view_data,
      createdAt: post.created_at,
      comments: post.comments.available.map { |c| c.view_data(user) },
      likedCount: post.likes.available.count,

      # add stat depending on specified user; mainly current_user
      isLiked: post.likes.available.where(liked_by_id: user&.id).exists?,
    )
  end
end

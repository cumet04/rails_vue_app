class ViewData::Comment < ViewData::Base
  attr_accessor :id, :content, :author, :createdAt, :likedCount,
                :isLiked

  def self.generate(comment, user = nil)
    self.new(
      id: comment.id,
      content: comment.content,
      author: comment.author.view_data,
      createdAt: comment.created_at,
      likedCount: comment.likes.available.count,
      isLiked: comment.likes.available.where(liked_by_id: user&.id).exists?,
    )
  end
end

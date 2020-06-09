class ViewData::Comment < ViewData::Base
  attr_accessor :id, :content, :author, :createdAt,
                :isLiked

  def self.generate(comment, user = nil)
    self.new(
      id: comment.id,
      content: comment.content,
      author: comment.author.view_data,
      createdAt: comment.created_at,
      isLiked: comment.likes.available.where(liked_by_id: user&.id).exists?,
    )
  end
end

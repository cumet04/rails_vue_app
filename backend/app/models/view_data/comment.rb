class ViewData::Comment < ViewData::Base
  attr_accessor :id, :content, :author, :createdAt

  def self.generate(comment)
    self.new(
      id: comment.id,
      content: comment.content,
      author: comment.author.view_data,
      createdAt: comment.created_at,
    )
  end
end

class ViewData::Post < ViewData::Base
  attr_accessor :id, :title, :content, :author, :createdAt, :comments

  def self.generate(post)
    self.new(
      id: post.id,
      title: post.title,
      content: post.content,
      author: post.author.view_data,
      createdAt: post.created_at,
      comments: post.comments.available.map(&:view_data),
    )
  end
end

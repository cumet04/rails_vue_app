class ViewData::Post < ViewData::Base
  attr_accessor :id, :title, :content, :author, :createdAt

  def self.generate(post)
    self.new(
      id: post.id,
      title: post.title,
      content: post.content,
      author: ViewData::User.generate(post.author),
      createdAt: post.created_at,
    )
  end
end

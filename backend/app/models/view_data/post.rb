class ViewData::Post < ViewData::Base
  attr_accessor :id, :title, :content, :createdAt

  def self.generate(post)
    self.new(
      id: post.id,
      title: post.title,
      content: post.content,
      createdAt: post.created_at,
    )
  end
end

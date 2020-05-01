class ViewData::User < ViewData::Base
  attr_accessor :id, :email, :name

  def self.generate(user)
    self.new(
      id: user.id,
      email: user.email,
      name: user.name,
    )
  end
end

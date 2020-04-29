class ViewData::User < ViewData::Base
  attr_accessor :id, :email

  def self.generate(user)
    self.new(
      id: user.id,
      email: user.email,
    )
  end
end

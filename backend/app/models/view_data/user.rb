class ViewData::User < ViewData::Base
  attr_accessor :email

  def self.generate(user)
    self.new(
      email: user.email,
    )
  end
end

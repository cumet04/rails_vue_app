class ViewData::User < ViewData::Base
  attr_accessor :id, :email, :name, :biography

  def self.generate(user)
    return self.new(deleted_user) unless user.available?

    self.new(
      id: user.id,
      email: user.email,
      name: user.name,
      biography: user.biography || "",
    )
  end

  private

  def self.deleted_user
    {
      id: nil,
      email: "",
      name: "(deleted user)",
      biography: "",
    }
  end
end

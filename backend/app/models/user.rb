# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  deleted_at         :datetime
#  email              :string(255)      not null
#  encrypted_password :string(255)      not null
#  is_available       :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email_and_is_available  (email,is_available) UNIQUE
#

class User < ApplicationRecord
  include Deletable

  has_many :posts, foreign_key: :author_id

  validates :email, presence: true
  validate :validate_password, if: :new_record?

  def self.authenticate(email, password)
    self.find_by(
      email: email,
      encrypted_password: self.digest(password),
      is_available: true,
    )
  end

  def password=(value)
    @password = value
    self.encrypted_password = self.class.digest(value)
  end

  def view_data
    ViewData::User.generate(self)
  end

  private

  def validate_password
    # TODO: impl
    if @password.length < 8
      errors.add(:password, ": too short")
    end
  end

  def self.digest(raw)
    Digest::SHA512.hexdigest(raw)
  end
end

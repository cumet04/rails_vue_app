# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string
#  encrypted_password :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  validates :email, presence: true
  validate :validate_password, if: :new_record?

  def self.authenticate(email, password)
    self.find_by(email: email, encrypted_password: self.digest(password))
  end

  def password=(value)
    @password = value
    self.encrypted_password = self.class.digest(value)
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

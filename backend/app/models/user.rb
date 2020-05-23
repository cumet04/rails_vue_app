# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  biography          :text(65535)
#  deleted_at         :datetime
#  email              :string(255)      not null
#  encrypted_password :string(255)      not null
#  is_available       :boolean
#  name               :string(255)      not null
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
  has_many :likes, foreign_key: :liked_by_id

  validates :email, presence: true
  validate :validate_password, if: :new_record?
  validates :name, presence: true

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
    unless PasswordValidator.long_enough?(@password)
      errors.add(:password, ": too short")
    end
    unless PasswordValidator.contains_char_types?(@password)
      errors.add(:password, ": not enough character type")
    end
  end

  def self.digest(raw)
    Digest::SHA512.hexdigest(raw)
  end
end

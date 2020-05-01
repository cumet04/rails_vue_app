# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

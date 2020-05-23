# == Schema Information
#
# Table name: likes
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  is_available :boolean
#  target_type  :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  liked_by_id  :bigint           not null
#  target_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_liked_by_id      (liked_by_id)
#  index_likes_on_user_and_target  (target_type,target_id,liked_by_id,is_available) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (liked_by_id => users.id)
#
class Like < ApplicationRecord
  include Deletable

  belongs_to :liked_by, class_name: User.name
end

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
  LIKEABLE_CLASS = [Post.name, Comment.name]
  include Deletable

  belongs_to :liked_by, class_name: User.name

  validate :validate_target

  def target
    target_type.constantize.find_by(id: target_id)
  end

  def target=(value)
    target_type = value.class.name
    target_id = value.id
  end

  def self.likeable?(target)
    LIKEABLE_CLASS.include?(target.class.name)
  end

  private

  def validate_target
    unless Like::LIKEABLE_CLASS.include?(self.target_type)
      errors.add(:target_type, ": unexpected type")
    end
    unless target
      errors.add(:target_type, ": not exist")
    end
  end
end

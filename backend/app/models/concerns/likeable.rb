module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, ->(target) { where(target_type: target.class.name) }, foreign_key: :target_id
    has_many :like_users, through: :likes, foreign_key: :liked_by_id, source: :liked_by
  end
end

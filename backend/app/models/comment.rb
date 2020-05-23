# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  content      :text(65535)
#  deleted_at   :datetime
#  is_available :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint           not null
#  post_id      :bigint           not null
#
# Indexes
#
#  index_comments_on_author_id  (author_id)
#  index_comments_on_post_id    (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Comment < ApplicationRecord
  include Likeable
  include Deletable

  belongs_to :author, class_name: User.name
  belongs_to :post

  def view_data
    ViewData::Comment.generate(self)
  end
end

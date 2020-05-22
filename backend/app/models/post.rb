# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  content      :text(65535)
#  deleted_at   :datetime
#  is_available :boolean
#  title        :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_title      (title)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Post < ApplicationRecord
  include Deletable

  belongs_to :author, class_name: User.name
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true

  def view_data
    ViewData::Post.generate(self)
  end
end

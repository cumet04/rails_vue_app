# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  content      :text(65535)
#  deleted_at   :datetime
#  is_available :boolean
#  title        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint
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
end

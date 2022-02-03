# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id           :uuid             not null, primary key
#  content_html :text
#  content_json :text
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :uuid
#  creator_id   :uuid             not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_creator_id   (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (creator_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category, optional: true
end

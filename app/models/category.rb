# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid
#
# Indexes
#
#  index_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', foreign_key: 'category_id', optional: true
  has_many :children, class_name: 'Category', dependent: :destroy
end

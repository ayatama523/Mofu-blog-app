# frozen_string_literal: true

module ApplicationHelper
  def category_options(categories)
    return if categories.blank?

    categories.map do |category|
      [category.name, category.id]
    end
  end
end

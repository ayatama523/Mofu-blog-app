# frozen_string_literal: true

class Admin::PostsPolicy < Admin::ApplicationPolicy
  def index?
    admin?
  end

  def edit?
    admin?
  end
end

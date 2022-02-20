# frozen_string_literal: true

class Admin::Api::PostsPolicy < Admin::ApplicationPolicy
  def show?
    admin?
  end

  def update?
    admin?
  end
end

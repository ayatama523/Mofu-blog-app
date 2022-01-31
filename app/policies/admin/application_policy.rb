# frozen_string_literal: true

class Admin::ApplicationPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def new?
    admin?
  end

  def create?
    admin?
  end

  def destroy?
    admin?
  end

  def edit?
    admin?
  end

  def update?
    admin?
  end
end

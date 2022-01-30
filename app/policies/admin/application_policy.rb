# frozen_string_literal: true

class Admin::ApplicationPolicy < ApplicationPolicy
  def index?
    admin?
  end
end

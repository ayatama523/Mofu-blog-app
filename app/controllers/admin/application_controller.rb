# frozen_string_literal: true

class Admin::ApplicationController < ActionController::Base
  layout 'admin/layouts/admin'

  include Pundit
  include ErrorHandlers

  before_action :authenticate_user!
  before_action :pundit_auth_controller
  before_action :set_current_user

  helper_method :action_policy

  def action_policy(controller = controller_path)
    dirs = controller.to_s.split('/').reject(&:blank?)
    policy(dirs.join('/').to_sym)
  rescue Pundit::NotDefinedError
    policy(:'admin/application')
  end

  private

  def pundit_auth_controller
    authorize(controller_path.to_sym)
  rescue Pundit::NotDefinedError
    authorize(:'admin/application')
  end

  def pundit_user
    current_user
  end

  def set_current_user
    RequestStore.store[:current_user] = current_user
  end
end

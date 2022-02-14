# frozen_string_literal: true

class Admin::Users::SessionsController < Devise::SessionsController
  layout 'admin/layouts/devise'

  private

  def after_sign_in_path_for(_resource)
    admin_root_path
  end

  def after_sign_out_path_for(_resource)
    admin_root_path
  end
end

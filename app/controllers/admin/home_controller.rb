# frozen_string_literal: true

class Admin::HomeController < Admin::ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index]

  def index
    @greeting = 'hello world'
  end
end

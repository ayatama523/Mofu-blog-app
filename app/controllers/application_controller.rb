# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  include ErrorHandlers
end

class ApplicationController < ActionController::Base
  include Pundit
  include ErrorHandlers
end

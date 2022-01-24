# frozen_string_literal: true

# rubocop:disable Naming/VariableNumber

module ErrorHandlers
  extend ActiveSupport::Concern

  unless Rails.application.config.consider_all_requests_local
    included do
      rescue_from StandardError, with: :render500
      rescue_from AbstractController::ActionNotFound, with: :render404
      rescue_from ActionView::MissingTemplate, with: :render404
      rescue_from ActionController::RoutingError, with: :render404
      rescue_from ActionController::UnknownFormat, with: :render404
      rescue_from ActiveRecord::RecordNotFound, with: :render404
      rescue_from ActiveRecord::RecordInvalid, with: :render422
      rescue_from ActionController::ParameterMissing, with: :render400
      rescue_from ActionController::InvalidCrossOriginRequest, with: :render400
      rescue_from ActionController::InvalidAuthenticityToken, with: :permission_denied
      rescue_from Pundit::NotAuthorizedError, with: :permission_denied
    end
  end

  def render400(e = nil)
    Rails.logger.info "Rendering 400 with exception: #{e&.message}"

    if request.xhr? || request.format&.ref == :json
      render json: { error: '400 bad request' }, status: :bad_request
    else
      head :bad_request
    end
  end

  def render404(e = nil)
    Rails.logger.info "Rendering 404 with exception: #{e&.message}"

    if request.xhr? || request.format&.ref == :json
      render json: { error: '404 error' }, status: :not_found
    else
      respond_to do |format|
        format.html { render file: 'public/404.html', status: :not_found }
        format.any { head :not_found }
      end
    end
  end

  def render422(e = nil)
    Rails.logger.info "Rendering 422 with exception: #{e&.message}"

    if request.xhr? || request.format&.ref == :json
      render json: {
        error: '422 error',
        messages: e.record.errors.full_messages
      }, status: :unprocessable_entity
    else
      respond_to do |format|
        format.html { render file: 'public/422.html', status: :unprocessable_entity }
        format.any { head :unprocessable_entity }
      end
    end
  end

  def render500(e = nil)
    Rails.logger.error "Rendering 500 with exception: #{e&.message}"
    if e
      Rails.logger.error e.backtrace.join("\n")
      ExceptionNotifier.notify_exception(e, env: request.env)
    end

    if request.xhr? || request.format&.ref == :json
      render json: { error: '500 error' }, status: :internal_server_error
    else
      respond_to do |format|
        format.html { render file: 'public/500.html', status: :internal_server_error }
        format.any { head :internal_server_error }
      end
    end
  end

  def permission_denied(e = nil)
    Rails.logger.warn "Permission denied exception: #{e&.message}"

    if request.xhr? || request.format&.ref == :json
      render json: { error: '403 error' }, status: :forbidden
    else
      head :forbidden
    end
  end

  def exceptions
    e = request.env['action_dispatch.exception']
    Rails.logger.error "Other exceptions: #{e.message}"
    Rails.logger.error e.backtrace.join("\n")
    ExceptionNotifier.notify_exception(e, env: request.env)
    render file: 'public/500.html', status: :internal_server_error
  end
end

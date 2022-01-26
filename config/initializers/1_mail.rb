# frozen_string_literal: true

Rails.application.configure do
  if Rails.env.development?
    config.action_mailer.default_url_options = {  host: 'localhost', port: 3000 }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:"smtp.gmail.com",
      domain: 'gmail.com',
      port:587,
      user_name: ENV.fetch('GMAIL_USERNAME').to_s,
      password: ENV.fetch('GMAIL_PASSWORD').to_s,
      authentication: :login
    }
  else
    config.action_mailer.perform_deliveries = true
    config.action_mailer.default_url_options = {
      protocol: 'https',
      host: ENV.fetch('SERVER_HOST').to_s
    }
    config.action_mailer.delivery_method = :sendgrid
    ActionMailer::Base.add_delivery_method :sendgrid, Mail::SendGrid, api_key: ENV['SENDGRID_API_KEY']
  end
end

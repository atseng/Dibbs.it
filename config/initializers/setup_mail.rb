require 'development_mail_interceptor'

ActionMailer::Base.smtp_settings = {
  :address                    => "smtp.gmail.com",
  :port                       => 587,
  :domain                     => 'blah.com',
  :user_name                  => 'gmail username',
  :password                   => 'gmail password',
  :authentication             => 'plain',
  :enable_starttls_auto       => true
}


ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?


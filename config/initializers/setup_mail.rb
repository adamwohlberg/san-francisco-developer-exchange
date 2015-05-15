# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => 587,
#   :domain               => "SanFranciscoDeveloperExchange.com",
#   :user_name            => ENV['GMAIL_USERNAME'],
#   :password             => ENV['GMAIL_PASSWORD'],
#   :authentication       => "plain",
#   :enable_starttls_auto => true
# }

# ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development? || Rails.env.production?


ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'sanfranciscodeveloperexchange.com',
  :enable_starttls_auto => true
}

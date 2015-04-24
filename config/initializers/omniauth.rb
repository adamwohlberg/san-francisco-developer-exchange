OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
#            :scope => 'email', :display => 'popup'
# end

# OmniAuth.config.on_failure = Proc.new do |env| new_path = "/auth/failure"
#  [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], {
#     :scope => "email", :display => "popup"}
# end
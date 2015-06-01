class SendAdminNewUserEmail < ActionMailer::Base
  default from: "ai@sanfranciscodeveloperexchange.com"
  def send_admin_new_user_email(user)
  	@user = user
    admin_email = ENV['ADMINISTRATOR_EMAIL']
    mail(to: admin_email, subject: "Congrats! A new user just signed up! Snap!!!")
  end
end


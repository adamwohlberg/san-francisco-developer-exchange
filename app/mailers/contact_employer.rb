class ContactEmployer < ActionMailer::Base
  default :from => "noreply@sf.com"
  def new_negotiation_email(negotiation, message)
  	@negotiation = negotiation
  	@developer = @negotiation.developer
    @employer = @negotiation.employer
    @message = message
    mail(to: @employer.email, subject: "Your Developer Responded", bcc: ENV["ADMINISTRATOR_EMAIL"])
  end
end
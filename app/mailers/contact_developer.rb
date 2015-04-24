class ContactDeveloper < ActionMailer::Base
  default :from => "noreply@sf.com"
  def new_negotiation_email(negotiation, message)
  	@negotiation = negotiation
  	@developer = @negotiation.developer
  	@contract = @negotiation.contract
    @message = message
  	if @negotiation.negotiation_messages.employer_message.count == 1
  	  mail(to: @developer.email, subject: "Someone Wants to Interview You")
  	else
  	  mail(to: @developer.email, subject: "The Employer Responded")  	
	  end
  end

end



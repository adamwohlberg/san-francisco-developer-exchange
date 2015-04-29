class HireDeveloper < ActionMailer::Base
  default :from => "noreply@sf.com"
  def you_just_got_hired_email(developer, contract)
 	@developer = developer 
 	@contract = contract
    mail(to: @developer.email, subject: "You Just Got Hired", bcc: ENV["ADMINISTRATOR_EMAIL"])
  end
end
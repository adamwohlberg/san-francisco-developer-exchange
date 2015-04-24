class DeveloperRejectsOffer < ActionMailer::Base
  default from: "from@example.com"
  def developer_has_rejected_your_offer(contract)
  	@developer = contract.developer
  	@contract = contract
  	@employer = contract.employer
    mail(to: @employer.email, subject: "Your offer has been declined", bcc: ENV['ADMINISTRATOR_EMAIL'])
  end
end



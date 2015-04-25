class DeveloperContactEmployer < ActionMailer::Base
  default from: "from@example.com"
  def developer_interested_in_contract(developer, contract)
  	@developer = developer
  	@contract = contract
  	@employer = contract.employer
    mail(to: @employer.email, subject: "Yes, I'm Interested")
  end
end

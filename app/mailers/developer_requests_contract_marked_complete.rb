class DeveloperRequestsContractMarkedComplete < ActionMailer::Base
  default from: 'from@example.com'
  def please_mark_contract_complete(contract)
    @developer = contract.developer
    @contract = contract
    @employer = contract.employer
    mail(to: @employer.email, subject: 'Congratulations. The contract is complete', bcc: ENV['ADMINISTRATOR_EMAIL'])
  end
end

class ContactAdministrator < ActionMailer::Base
  default from: 'from@example.com'
  def employer_marked_contract_closed_now_pay_the_developer(contract)
    @contract = contract
    admin_email = ENV['ADMINISTRATOR_EMAIL']
    mail(to: admin_email, subject: 'Pay the developer')
  end
end

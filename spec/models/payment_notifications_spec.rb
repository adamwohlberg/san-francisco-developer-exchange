require "rails_helper"

RSpec.describe PaymentNotification, :type => :model do
  it "creates an instant payment with PayPal" do
    PaymentNotification.create_entry
	  expect(PaymentNotification.count).to eq 0
    PaymentNotification.create_entry(paypal_params)
    expect(PaymentNotification.count).to eq 1
  end

  def paypal_params
  	{"mc_gross"=>"16850.40", "invoice"=>"11", "protection_eligibility"=>"Eligible", "address_status"=>"confirmed", "payer_id"=>"YG4HF52R7XHMG", "tax"=>"0.00", "address_street"=>"1 Main St", "payment_date"=>"09:39:14 Apr 14, 2015 PDT", "payment_status"=>"Completed", "charset"=>"windows-1252", "address_zip"=>"95131", "first_name"=>"Kumar", "mc_fee"=>"488.96", "address_country_code"=>"US", "address_name"=>"Kumar Fakefake", "notify_version"=>"3.8", "custom"=>"", "payer_status"=>"verified", "business"=>"adam.wohlberg@gmail.com", "address_country"=>"United States", "address_city"=>"San Jose", "quantity"=>"1", "payer_email"=>"kumar@zmail.com", "verify_sign"=>"AraObw6BNHF-WmIJ8waqqrOxjNLZAt0kX.373ihTOCHsyjoMqw23p2O-", "txn_id"=>"5US61631EN098572C", "payment_type"=>"instant", "last_name"=>"Fakefake", "address_state"=>"CA", "receiver_email"=>"adam.wohlberg@gmail.com", "payment_fee"=>"488.96", "receiver_id"=>"JXMN5WDZQX6XW", "txn_type"=>"web_accept", "item_name"=>"Developer Services", "mc_currency"=>"USD", "item_number"=>"", "residence_country"=>"US", "test_ipn"=>"1", "handling_amount"=>"0.00", "transaction_subject"=>"", "payment_gross"=>"16850.40", "shipping"=>"0.00", "developer_id" => "1", "auth"=>"A6nYJJNzPAfa7slWb7RaPIY29AgLoQQOPJ.jrtJxTunnZ520ocw.uWfkBZVwAobffeKslcwJVaIhy50yc1.nrhw"}
  end

end



describe "PaymentNotificationsController", :integration => true do
  
 PayoutAttributes = {
      :sender_batch_header => {
          :sender_batch_id => "12345678",
          :email_subject => 'You have a Payout!'
      },
      :items => [
          {
              :recipient_type => 'kumar@zmail.com',
              :amount => {
                  :value => '1.0',
                  :currency => 'USD'
              },
              :note => 'Thanks for your patronage!',
              :sender_item_id => '2014031400023',
              :receiver => 'shirt-supplier-one@mail.com'
          }
      ]
  }

    it "creates an instant payment with PayPal" do

      post :create
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

  
  it "create payout sync" do
    
    payout = PayPal::SDK::REST::Payout.new(PayoutAttributes)
    payout_batch = payout.create(true)
    expect(payout_batch).to be_truthy
  end

end


 
# == Schema Information
#
# Table name: payment_notifications
#
#  id             :integer          not null, primary key
#  params         :text
#  cart_id        :integer
#  status         :string(255)
#  transaction_id :string(255)
#  create         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class PaymentNotification < ActiveRecord::Base
  belongs_to :contract
  serialize :params

  validates_presence_of :params, :contract_id, :status, :transaction_id

  def self.create_entry(params = {})
    payment_notification = new(params: params, contract_id: params['invoice'], status: params['payment_status'], transaction_id: params['txn_id'])
    if payment_notification.save && params['payment_status'] == 'Completed'
      if payment_notification.contract
        # todo remove last if when using factorygirl
        payment_notification.contract.update_attributes(developer_id: params['developer_id'], paid: true)
        payment_notification.contract.developer.update_attributes(balance: payment_notification.contract.amount)
        # Contact the developer with the developer's contact information
        HireDeveloper.you_just_got_hired_email(payment_notification.contract.developer, payment_notification.contract).deliver
      end
      return true
    end
    false
  end
end

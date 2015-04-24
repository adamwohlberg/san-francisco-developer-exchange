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

require 'test_helper'

class PaymentNotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

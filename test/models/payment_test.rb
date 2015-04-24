# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  amount      :integer
#  contract_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

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

class Payment < ActiveRecord::Base
  has_many :line_items
  belongs_to :contract
  belongs_to :developer

  def new
  @payment = Payment.new 
  end

  def update 

  end
end

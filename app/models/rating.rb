# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  contract_id :integer
#  developer   :integer
#  employer    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Rating < ActiveRecord::Base
  belongs_to :contract
end

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

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

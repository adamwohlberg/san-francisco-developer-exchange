# == Schema Information
#
# Table name: skills
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  developer_id :integer
#  contract_id  :integer
#  verified     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: negotiations
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  message_content :text
#  filename        :string(255)
#  content_type    :string(255)
#  data            :binary
#  developer_id    :integer
#  employer_id     :integer
#  summary         :string(255)
#  contract_id     :integer
#

require 'test_helper'

class NegotiationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

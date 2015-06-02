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

class Negotiation < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :contract
	belongs_to :developer
	belongs_to :employer
	has_many :negotiation_messages

end

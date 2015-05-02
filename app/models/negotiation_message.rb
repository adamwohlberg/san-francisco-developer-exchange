class NegotiationMessage < ActiveRecord::Base
  scope :employer_message, -> { where(is_employer: true) }
  scope :developer_message, -> { where(is_employer: false) }
end

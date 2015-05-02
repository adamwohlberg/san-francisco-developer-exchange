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

class Skill < ActiveRecord::Base
  # belongs_to :developer
  has_and_belongs_to_many :developers
  belongs_to :skill_category

  default_scope -> { order :position }

  has_and_belongs_to_many :contracts
end

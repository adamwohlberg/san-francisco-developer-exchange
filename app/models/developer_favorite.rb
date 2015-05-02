# == Schema Information
#
# Table name: developer_favorites
#
#  developer_id :integer
#  contract_id  :integer
#

class DeveloperFavorite < ActiveRecord::Base
  belongs_to :developer
  belongs_to :contract
end

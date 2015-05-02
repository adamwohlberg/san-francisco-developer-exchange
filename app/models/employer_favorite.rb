# == Schema Information
#
# Table name: employer_favorites
#
#  employer_id  :integer
#  developer_id :integer
#

class EmployerFavorite < ActiveRecord::Base
  belongs_to :employer
  belongs_to :developer
end

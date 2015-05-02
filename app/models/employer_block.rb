class EmployerBlock < ActiveRecord::Base
  belongs_to :employer
  belongs_to :developer
end

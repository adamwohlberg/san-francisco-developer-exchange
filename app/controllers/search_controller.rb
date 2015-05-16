class SearchController < ApplicationController
	before_action  :authenticate_user!
	# before_action  :authorize_employer!, only: [:searching_for_developers]
	# before_action  :authorize_developer!, only: [:searching_for_contracts]

 layout 'no_errors_layout'

  def searching_for_developers
  	render 'searching_for_developers'
  end

  def searching_for_contracts
  	render 'searching_for_contracts'
  end

  private

  # def authorize_employer!
  # 	redirect_to :root unless current_user.is_a? Employer
  # end

  # def authorize_developer!
  # 	redirect_to :root unless current_user.is_a? Developer
  # end

end

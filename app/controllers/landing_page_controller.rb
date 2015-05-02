class LandingPageController < ApplicationController
  layout 'landing_page_with_video_attribution'

  def index
    if user_signed_in? && current_user.type == 'Developer'
      redirect_to search_contracts_path
    elsif user_signed_in? && current_user.type == 'Employer'
      redirect_to search_developers_path
    else
      render 'index'
     end
  end
end

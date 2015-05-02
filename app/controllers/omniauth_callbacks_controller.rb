class OmniauthCallbacksController < Devise::OmniauthCallbacksController
# skip_before_action :verify_authenticity_token
# skip_before_filter :verify_authenticity_token
before_filter :check_user_exists

  def all
    user = User.from_omniauth(request.env["omniauth.auth"], request.env["omniauth.params"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in user
      redirect_to search_contracts_path
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :facebook, :all

  private

  def check_user_exists
    auth = request.env["omniauth.auth"]
    u = User.where(provider: auth.provider, uid: auth.uid).first
    redirect_to register_path if request.env["omniauth.auth"] && request.env["omniauth.params"].blank? && u.blank?
  end
end
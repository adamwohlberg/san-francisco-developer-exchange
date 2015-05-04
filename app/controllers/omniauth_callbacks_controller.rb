class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :check_user_exists

  def all
    user = User.from_omniauth(request.env["omniauth.auth"], request.env["omniauth.params"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in user
      redirect_to search_contracts_path
    else
      session["devise.user_attributes"] = user.attributes
      session[:errors] = user.errors.full_messages.join("<br/>").html_safe
      redirect_to URI(request.referer).path
    end
  end
  alias_method :facebook, :all

  private

  def check_user_exists
    auth = request.env["omniauth.auth"]
    u = User.where(provider: auth.provider, uid: auth.uid).first
    if request.env["omniauth.auth"] && request.env["omniauth.params"].blank? && u.blank?
      if URI(request.referer).path == '/login'
        session[:errors] = "You need to register with facebook and need to select user-type. Because you are not registered user!"
        redirect_to URI(request.referer).path
      else
        session[:errors] = "You can't login with facebook because you have already sign-up with this email id."
        redirect_to URI(request.referer).path
      end
    end  
  end

end
class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    # first-time users stay on page until confirmed
    if flash[:notice] = 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
        redirect_to register_path
    else
    	redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

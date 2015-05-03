class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    # first-time users stay on page until confirmed
    if user.confirmed?
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

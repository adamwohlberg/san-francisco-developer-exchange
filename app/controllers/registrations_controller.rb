class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
    sign_up = params.require(:user).permit(:first_name, :last_name, :type, :email, :avatar, :location, :latitude, :longitude, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :type, :email, :avatar, :location, :latitude, :longitude, :password, :password_confirmation, :current_password)
  end
end



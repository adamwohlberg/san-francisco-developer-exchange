class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  def create
    super
  end


  private 

  def after_inactive_sign_up_path_for(resource)
    register_path
  end  

  def sign_up_params
    sign_up = params.require(:user).permit(
      :first_name,
      :email,
      :location,
      :type,
      :password, 
      :password_confirmation 
    )
    sign_up.merge!(type: params.require(:type))

  end

end

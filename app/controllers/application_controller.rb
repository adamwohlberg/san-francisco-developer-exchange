class ApplicationController < ActionController::Base
  # http_basic_authenticate_with :name => "admin", :password => "password"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :location, :avatar, :password, :password_confirmation, :current_password, :first_name, :middlename, :lastname) }
  end
end

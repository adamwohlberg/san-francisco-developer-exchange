class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :location, :avatar, :password, :password_confirmation, :current_password, :first_name, :middlename, :lastname)}
  end

# From RailsCasts - remove if not needed
  # def current_contract
  #   if session[:contract_id]
  #     @current_contract ||= Contract.find(session[:contract_id])
  #     session[:contract_id] = nil if @current_contract.purchased_at
  # end
  #   if session[:contract_id].nil?
  #     @current_contract = Contract.create!
  #     session[:contract_id] = @current_contract.id
  # end
  #   @current_contract
  # end
end


class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(employer_params)
  end

  private

  def employer_params
    params.require(:user).permit(:avatar, :location, :first_name)
   end
end

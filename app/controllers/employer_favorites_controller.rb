class EmployerFavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_employer_favorite, only: [:destroy]

  respond_to :json, :html

  def create
    employer_id = current_user.id
    developer_id = params[:developer_id]
    @employer_favorite = EmployerFavorite.create!(employer_id: employer_id, developer_id: developer_id)
    respond_to do |format|
      format.html { render(text: 'not implemented') }
      format.json { render json: @employer_favorite }
    end
  end

  def destroy
    employer_id = current_user.id
    developer_id = params[:developer_id]
    @employer_favorite = EmployerFavorite.where(employer_id: employer_id, developer_id: developer_id)
    @employer_favorite.delete_all
    respond_to do |format|
      format.html { render(text: 'not implemented') }
      format.json { render json: @employer_favorite }
    end
  end

  private

  def set_employer_favorite
    employer_id = current_user.id
    developer_id = params[:developer_id]
    @employer_favorite = EmployerFavorite.find_by(employer_id: employer_id, developer_id: developer_id)
  end

  def employer_favorite_params
    require(:employer_favorite).permit(:employer_id, :developer_id)
  end
end

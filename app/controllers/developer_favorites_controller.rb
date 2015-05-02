class DeveloperFavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_developer_favorite, only: [:destroy]

  respond_to :json, :html

  def create
    developer_id = current_user.id
    contract_id = params[:contract_id]
    @developer_favorite = DeveloperFavorite.create!(developer_id: developer_id, contract_id: contract_id)
    respond_to do |format|
      format.html { render(text: 'not implemented') }
      format.json { render json: @developer_favorite }
    end
  end

  def destroy
    developer_id = current_user.id
    contract_id = params[:contract_id]
    @developer_favorite = DeveloperFavorite.where(developer_id: developer_id, contract_id: contract_id)
    @developer_favorite.delete_all
    respond_to do |format|
      format.html { render(text: 'not implemented') }
      format.json { render json: @developer_favorite }
    end
  end

  private

  def set_developer_favorite
    developer_id = current_user.id
    contract_id = params[:contract_id]
    @developer_favorite = DeveloperFavorite.find_by(developer_id: developer_id, contract_id: contract_id)
  end

  def developer_favorite_params
    require(:developer_favorite).permit(:developer_id, :contract_id)
  end
end

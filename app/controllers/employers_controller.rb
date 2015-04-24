class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @developers = Developer.all
    @employers = Employer.all
    respond_with(@employers)
  end

  def show
    @employer =  Employer.find_by_username(params[:id]) 
    respond_with(@employer)
  end

  def new
    @employer = Employer.new
    respond_with(@employer)
  end

  def edit
  end

  def create
    @employer = Employer.new(employer_params)
    @employer.save
    respond_with(@employer)
  end

  def update
    @employer.update(employer_params)
    respond_with(@employer)
  end

  def destroy
    @employer.destroy
    respond_with(@employer)
  end

  private
    def set_employer
      @employer = Employer.find(params[:id])
    end

    def employer_params
      params.require(:employer).permit(:avatar, :location, :first_name, :name, :ein, :amount)
    end
end

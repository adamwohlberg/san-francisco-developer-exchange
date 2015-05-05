class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_application, only: [:show, :edit, :update, :destroy, :show_private, :send_email_to_developer, :send_email_to_employer]
  before_action :set_employer, only: [:edit]

  respond_to :html

  layout 'application'

  def index
  end

  def new
    @job_application = JobApplication.new
    @contract = Contract.find(params[:contract_id])
    if current_user.type == 'Developer'
      @developer = current_user
      @employer = @contract.employer
      DeveloperContactEmployer.developer_interested_in_contract(@developer,@contract).deliver
    elsif current_user.type == 'Employer'
      redirect_to 'index'
    end
    respond_with(@job_application)
  end

  def create
    contract = Contract.where(id: params["job_application"]["contract_id"]).first
    developer = Developer.where(id: params["job_application"]["developer_id"]).first
    if current_user.job_applications.where(contract_id: contract.id, employer_id: employer.id).first.present?
      return render json: 'You have already applied for this contract.', status: :unprocessable_entity 
    end
    @job_application = current_user.job_applications.new(job_application_params)
    if respond_to do |format|
        format.html { redirect_to(@job_application, notice: 'User was successfully created.') }
        format.json { render json: @job_application, status: :created, location: @job_application }
    end
    else
        format.html { render action: 'new' }
        format.json { render json: errors, status: :unprocessable_entity }
    end
  end


  private
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    def set_employer
      @contract = Contract.find(params[:contract_id])
      @employer = @contract.employer
    end

    def job_application_params 
      params.require(:job_application).permit(:employer_id, :developer_id, :contract_id)
    end
end
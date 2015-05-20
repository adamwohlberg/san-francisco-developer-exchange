class ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_employer!, only: [:new]
  before_action :set_contract, only: [:show, :edit, :update, :destroy, :my_contracts_edit]

  layout 'application'
  
  # GET /contracts
  # GET /contracts.json
  def index
    example_contract = Contract.find(1)
    @contracts = Contract.near(Geocoder.coordinates(current_user.location),500).visible.page(params[:page]).per(10)
    @contracts << example_contract
  end

  def my_contracts
      @contracts = current_user.contracts.visible
  end

  def my_contracts_edit
    @skills = @contract.skills
    @skill = Skill.new
    @skill_categories = SkillCategory.all.includes(:skills)
  end

  def show
    @developer = Developer.new
    @skill_categories = SkillCategory.all.includes(:skills)
    # if current_user.type == 'Employer'
    #   redirect_to action: "index"
    # end
    @contract = Contract.find(params[:id])
    @employer = @contract.employer
    @skills = @contract.skills
    @skill = Skill.new
  end

  def new
    @contract = Contract.new
    @skill_categories = SkillCategory.all.includes(:skills)
  end

  def edit
    @developer = Developer.find(params[:developer_id])
    @employer = current_user if current_user.type == 'Employer'
    @skill_categories = SkillCategory.all.includes(:skills)
  end

  def create
    @contract = Contract.new(contract_params)
    @employer = Employer.find(current_user.id)
    @contract = @employer.contracts.create(contract_params)
    @skill_categories = SkillCategory.all.includes(:skills)
    respond_to do |format|
      if @contract.save
        format.html { redirect_to new_contract_conversion_contracts_path }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_contract_conversion

  end

  def update
    if current_user.type == 'Employer'
      @contract = current_user.contracts.find(params[:id])
      @skill_categories = SkillCategory.all.includes(:skills)
      respond_to do |format|
        if contract_params[:amount].to_f < @contract.amount.to_f 
          flash[:alert] = 'Contract amount can not be reduced. Please create a new contract if you want to reduce the amount.'        
          format.html { render :my_contracts_edit}
        elsif @contract.update(contract_params)
          format.html { redirect_to '/developers#/list_developers/', notice: 'Contract was successfully updated.' }
          format.json { render :show, status: :ok, location: @contract }
        else
          format.html { render :edit }
          format.json { render json: @contract.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update_contract_status_as_closed_and_pay_developer
    if current_user.type == 'Employer'
      @contract = current_user.contracts.find(params[:id])
        if @contract.status == 'open' && @contract.paid == true 
          @contract.update_attributes(status: 'closed')
          ContactAdministrator.employer_marked_contract_closed_now_pay_the_developer(@contract).deliver 
          flash[:notice] = "Congratulations! This contract is now closed and the developer will be paid."
        else
          flash[:alert] = "There is an error. This contract cannot be closed."
        end
    end
  end

  def developer_requests_contract_marked_complete
    @contract = current_user.contracts.find(params[:id])
    if current_user.type == 'Developer'
        if @contract.status == 'open' && @contract.paid == true 
          DeveloperRequestsContractMarkedComplete.please_mark_contract_complete(@contract).deliver 
          flash[:notice] = "Congratulations! Your email has been sent to the employer"
        else
          flash[:alert] = "There is an error. Please contact your employer directly."
        end
    end
    redirect_to  contract_path(@contract.id)
  end

  def developer_rejects_contract_offer
    @contract = current_user.contracts.find(params[:id])
    if current_user.type == 'Developer'
        if @contract.status == 'open' && @contract.paid == true 
          @contract.update_attributes(developer_id: nil)
          DeveloperRejectsOffer.developer_has_rejected_your_offer(@contract).deliver
          flash[:notice] = "You have successfully rejected this offer.  We will notify the employer."
        else
          flash[:alert] = "There is an error. Please contact your employer directly."
        end
    end
    redirect_to  contract_path(@contract.id)
  end

  def destroy
    if @contract.status == 'open' && @contract.paid == false 
      @contract.update_attributes(visible: false)
      respond_to do |format|
        format.html { redirect_to my_contracts_path, notice: 'Contract was successfully destroyed.' }
        format.json { head :no_content }
      end
    elsif @contract.status == 'closed' || @contract.paid == true
      respond_to do |format|
        format.html { redirect_to my_contracts_path, notice: 'You cannot delete a contract that is closed or if it has been paid - please contact support (via the contact support) link at the bottom of this page).
        ' }
        format.json { head :no_content }
      end
    end
  end

  def upload
    uploaded_io = params[:contract][:image]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def check_developer_minimum
    contract = Contract.find(params[:contract][:contract_id])
    developer = Developer.find(params[:contract][:developer_id])
    contract_amount_is_greater_than_or_equal_to_developers_minimum = contract.amount.to_f >= developer.min_contract_amount
    respond_to do |format|
      if contract_amount_is_greater_than_or_equal_to_developers_minimum      
        format.json { render json: developer, status: :created }
      else
        errors = "Contract amount must be greater than the developer's required minimum contract amount"        
        format.json { render json: errors, status: :unprocessable_entity }
      end
    end
  end

  def self.download_pdf
    contract = Contract.find(params[:id])
    send_data File.open(contract.attachment.path, 'r').read , :filename => contract.attachment_file_name, :type => "application/pdf", :disposition => "attachment"
  end

  def download_pdf
    contract = Contract.find(params[:id])
    send_data File.open(contract.attachment.path, 'r').read , :filename => contract.attachment_file_name, :type => "application/pdf", :disposition => "attachment"
  end

  private

    def authenticate_employer!
      redirect_to :root unless current_user.is_a? Employer
    end

    def set_contract
      @contract = Contract.find(params[:id])
    end

    def contract_params
      params.require(:contract).permit(:developer_id, :attachment, :relationship_type, :location, :latitude, :longitude, :status, :paid, :type, :name, :title, :document, :ein, :agree_to_terms, :description, :amount, :id, :contract_avatar, skill_ids: [])
    end


end


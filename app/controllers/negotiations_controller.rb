class NegotiationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_negotiation, only: [:show, :edit, :update, :destroy, :show_private, :send_email_to_developer, :send_email_to_employer]
  before_action :set_developer, only: [:edit]

  respond_to :html

  layout 'application'

  def index
    @negotiations = Negotiation.all
    respond_with(@negotiations)
  end

  def show
    @negotiation = Negotiation.find(params[:id])
    @developer = @negotiation.developer
    @contract = @negotiation.contract
    @employer = @negotiation.employer
    respond_with(@negotiation)
  end

  def new
    @negotiation = Negotiation.new
    @contract = Contract.find(params[:contract_id])
    if current_user.type == 'Developer'
      @developer = current_user
      @employer = @contract.employer
      DeveloperContactEmployer.developer_interested_in_contract(@developer,@contract).deliver    
      flash[:notice] = "Congratulations. We just contacted the employer and let them know you're interested. Good luck!"    
    elsif current_user.type == 'Employer'
      redirect_to 'index'
    end
    respond_with(@negotiation)
  end

  def edit
  end

  def create
    contract = Contract.where(id: params["negotiation"]["contract_id"]).first
    developer = Developer.where(id: params["negotiation"]["developer_id"]).first
    @negotiation = current_user.negotiations.new(negotiation_params)
    contract_amount_is_greater_than_developers_minimum = contract.amount.to_f >= developer.min_contract_amount
    respond_to do |format|
      if contract_amount_is_greater_than_developers_minimum && @negotiation.save
        format.html { redirect_to(@negotiation, notice: 'User was successfully created.') }
        format.json { render json: @negotiation, status: :created, location: @negotiation }
      else
        errors = contract_amount_is_greater_than_developers_minimum ? @negotiation.errors : "Contract amount must be greater than the developer's required minimum contract amount"
        format.html { render action: 'new' }
        format.json { render json: errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @negotiation.update(negotiation_params)
    respond_with(@negotiation)
  end

  def destroy
    @negotiation.destroy
    respond_with(@negotiation)
  end

  def send_email_to_developer
    @negotiation.negotiation_messages.create!(message: params[:message], is_employer: true)
    ContactDeveloper.new_negotiation_email(@negotiation, params[:message]).deliver
    flash[:notice] = "Congratulations! Your message was sent to the developer."
    redirect_to negotiation_path(@negotiation)
  end

  def send_email_to_employer
    @negotiation.negotiation_messages.create!(message: params[:message])
    ContactEmployer.new_negotiation_email(@negotiation, params[:message]).deliver
    redirect_to negotiation_path(@negotiation)
  end

  def download_pdf
    contract = current_user.negotiations.where(id: params[:id]).first.contract
    send_data File.open(contract.attachment.path, 'r').read , :filename => "test", :type => "application/pdf", :disposition => "attachment"
  end

  private
    def set_negotiation
      @negotiation = Negotiation.find(params[:id])
    end

    def set_developer
      @developer = Developer.find(params[:developer_id])
    end

    def negotiation_params 
      params.require(:negotiation).permit(:employer_id, :developer_id, :contract_id)
    end
end

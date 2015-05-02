class DevelopersController < ApplicationController
  before_action :authenticate_user!,  only: [:new]
  before_action :authenticate_developer!, only: [:new]
  before_action :set_developer, only: [:edit, :update, :destroy]

  layout 'application'

  def index
    @developers = Developer.near(Geocoder.coordinates(current_user.location), 99_999).page(params[:page]).per(10)
  end

  def show
    # get user by profile name
    @developer = Developer.find_by_username(params[:id]) || Developer.find_by_id(params[:id])
    @skill_categories = SkillCategory.all.includes(:skills)
    if @developer
      @skills = @developer.skills
      @skill = Skill.new
      @contracts = Contract.all.pluck(:id, :name)
      @contract = Contract.new
      if current_user.type == 'Developer'
        redirect_to action: 'index'
      elsif current_user.type == 'Employer'
        @negotiation = @developer.negotiations.where(employer_id = current_user.id)
      end
      render action: 'show'
    else
      @developer = Developer.find_by_username(params[:id]) || Developer.find_by_id(params[:id])
      @skills = @developer.skills
      @skill = Skill.new
      @contracts = Contract.all.pluck(:id, :name)
      @contract = Contract.new
      if current_user.type == 'Developer'
        redirect_to action: 'index'
      elsif current_user.type == 'Employer'
        @negotiation = @developer.negotiations.where(employer_id = current_user.id)
      end
      render layout: 'application'
    end
  end

  def new
    @developer = Developer.new
    @skill_categories = SkillCategory.all.includes(:skills)
  end

  def edit
    @developer = Developer.find(params[:id])
    @skill_categories = SkillCategory.all.includes(:skills)
  end

  def create
    @developer = Developer.new(developer_params)
    @skill_categories = SkillCategory.all.includes(:skills)
    respond_to do |format|
      if @developer.save
        format.html { redirect_to new_profile_conversion_developers_path, notice: 'Developer was successfully created.' }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Find an existing object using form parameters
    @developer = Developer.find(params[:id])
    @skill_categories = SkillCategory.all.includes(:skills)
    if @developer.update_attributes(developer_params)
      redirect_to '/contracts#/list_contracts'
    else
      render('edit')
    end
  end

  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: 'Developer was successfully destroyed!' }
      format.json { head :no_content }
    end
  end

  def upload
    uploaded_io = params[:developer][:image]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def private_contact_info
    @developers = Developer.all
    @developer =  Developer.find(params[:id])
  end

  def new_profile_conversion
  end

  private

  def authenticate_developer!
    redirect_to :root unless current_user.is_a? Developer
  end

  def set_developer
    @developer = Developer.find(params[:id])
  end

  def developer_params
    params.require(:developer).permit(:avatar, :title, :paypal_email, :username, :description, :min_contract_amount,
                                      :full_time_option, :min_full_time_amount, :cell, :image, :agree_to_terms, skill_ids: [])
  end
end

class SkillsController < ApplicationController
  def index
  end

  def new
  	@skill = Skill.new
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(skill_params)
  end

  def create
    @skill = Skill.new(skill_params)
  end

  def delete
  end

  private

  def skill_params
     params.require(:skill).permit(:name, :developer_id, :contract_id, :verified)
  end

end


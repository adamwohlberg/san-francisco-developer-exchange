class TradingFloorController < ApplicationController

	layout 'trading_floor'

	def index
		contracts = Contract.near(Geocoder.coordinates(current_user.location),100)
		developers = Developer.near(Geocoder.coordinates(current_user.location),100)

		@developer_php_junior = developers.where(title: 'PHP Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_php_midlevel = developers.where(title: 'PHP Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_php_senior = developers.where(title: 'PHP Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_php_junior = contracts.where(title: 'PHP Developer (Junior)').order(amount: :desc).first
		@contract_php_midlevel = contracts.where(title: 'PHP Developer (Mid-level)').order(amount: :desc).first
		@contract_php_senior = contracts.where(title: 'PHP Developer (Senior)').order(amount: :desc).first

		@developer_ruby_junior = developers.where(title: 'Ruby on Rails Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_ruby_midlevel = developers.where(title: 'Ruby on Rails Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_ruby_senior = developers.where(title: 'Ruby on Rails Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_ruby_junior = contracts.where(title: 'Ruby on Rails Developer (Junior)').order(amount: :desc).first
		@contract_ruby_midlevel = contracts.where(title: 'Ruby on Rails Developer (Mid-level)').order(amount: :desc).first
		@contract_ruby_senior = contracts.where(title: 'Ruby on Rails Developer (Senior)').order(amount: :desc).first
	
		@developer_ios_junior = developers.where(title: 'iOS Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_ios_midlevel = developers.where(title: 'iOS Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_ios_senior = developers.where(title: 'iOS Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_ios_junior = contracts.where(title: 'iOS Developer (Junior)').order(amount: :desc).first
		@contract_ios_midlevel = contracts.where(title: 'iOS Developer (Mid-level)').order(amount: :desc).first
		@contract_ios_senior = contracts.where(title: 'iOS Developer (Senior)').order(amount: :desc).first
	
		@developer_android_junior = developers.where(title: 'Android Developer (Junior)').order(min_contract_amount: :asc).first
		@developer__android_midlevel = developers.where(title: 'Android Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer__android_senior = developers.where(title: 'Android Developer (Senior)').order(min_contract_amount: :asc).first
		@contract__android_junior = contracts.where(title: 'Android Developer (Junior)').order(amount: :desc).first
		@contract__android_midlevel = contracts.where(title: 'Android Developer (Mid-level)').order(amount: :desc).first
		@contract__android_senior = contracts.where(title: 'Android Developer (Senior)').order(amount: :desc).first

		@developer_java_junior = developers.where(title: 'Java Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_java_midlevel = developers.where(title: 'Java Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_java_senior = developers.where(title: 'Java Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_java_junior = contracts.where(title: 'Java Developer (Junior)').order(amount: :desc).first
		@contract_java_midlevel = contracts.where(title: 'Java Developer (Mid-level)').order(amount: :desc).first
		@contract_java_senior = contracts.where(title: 'Java Developer (Senior)').order(amount: :desc).first

		@developer_frontend_junior = developers.where(title: 'Front-End Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_frontend_midlevel = developers.where(title: 'Front-End Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_frontend_senior = developers.where(title: 'Front-End Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_frontend_junior = contracts.where(title: 'Front-End Developer (Junior)').order(amount: :desc).first
		@contract_frontend_midlevel = contracts.where(title: 'Front-End Developer (Mid-level)').order(amount: :desc).first
		@contract_frontend_senior = contracts.where(title: 'Front-End Developer (Senior)').order(amount: :desc).first

		@developer_ui_ux_junior = developers.where(title: 'UI/UX Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_ui_ux_midlevel = developers.where(title: 'UI/UX Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_ui_ux_senior = developers.where(title: 'UI/UX Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_ui_ux_junior = contracts.where(title: 'UI/UX Developer (Junior)').order(amount: :desc).first
		@contract_ui_ux_midlevel = contracts.where(title: 'UI/UX Developer (Mid-level)').order(amount: :desc).first
		@contract_ui_ux_senior = contracts.where(title: 'UI/UX Developer (Senior)').order(amount: :desc).first

		@developer_project_manager_junior = developers.where(title: 'Project Manager (Junior)').order(min_contract_amount: :asc).first
		@developer_project_manager_midlevel = developers.where(title: 'Project Manager (Mid-level)').order(min_contract_amount: :asc).first
		@developer_project_manager_senior = developers.where(title: 'Project Manager (Senior)').order(min_contract_amount: :asc).first
		@contract_project_manager_junior = contracts.where(title: 'Project Manager (Junior)').order(amount: :desc).first
		@contract_project_manager_midlevel = contracts.where(title: 'Project Manager (Mid-level)').order(amount: :desc).first
		@contract_project_manager_senior = contracts.where(title: 'Project Manager (Senior)').order(amount: :desc).first

		@developer_creative_director_junior = developers.where(title: 'Creative Director (Junior)').order(min_contract_amount: :asc).first
		@developer_creative_director_midlevel = developers.where(title: 'Creative Director (Mid-level)').order(min_contract_amount: :asc).first
		@developer_creative_director_senior = developers.where(title: 'Creative Director (Senior)').order(min_contract_amount: :asc).first
		@contract_creative_director_junior = contracts.where(title: 'Creative Director (Junior)').order(amount: :desc).first
		@contract_creative_director_midlevel = contracts.where(title: 'Creative Director (Mid-level)').order(amount: :desc).first
		@contract_creative_director_senior = contracts.where(title: 'Creative Director (Senior)').order(amount: :desc).first

	end



end
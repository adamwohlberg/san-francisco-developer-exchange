class TradingFloorController < ApplicationController

	layout 'trading_floor'

	def index
		# @contracts = Contract.near(Geocoder.coordinates(current_user.location),100)
		# @developers = Developer.near(Geocoder.coordinates(current_user.location),100)

		@developer_php_junior = Developer.where(title: 'PHP Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_php_midlevel = Developer.where(title: 'PHP Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_php_senior = Developer.where(title: 'PHP Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_php_junior = Contract.where(name: 'PHP Developer (Junior)').order(amount: :desc).first
		@contract_php_midlevel = Contract.where(name: 'PHP Developer (Mid-level)').order(amount: :desc).first
		@contract_php_senior = Contract.where(name: 'PHP Developer (Senior)').order(amount: :desc).first

		@developer_ruby_junior = Developer.where(title: 'Ruby on Rails Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_ruby_midlevel = Developer.where(title: 'Ruby on Rails Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_ruby_senior = Developer.where(title: 'Ruby on Rails Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_ruby_junior = Contract.where(name: 'Ruby on Rails Developer (Junior)').order(amount: :desc).first
		@contract_ruby_midlevel = Contract.where(name: 'Ruby on Rails Developer (Mid-level)').order(amount: :desc).first
		@contract_ruby_senior = Contract.where(name: 'Ruby on Rails Developer (Senior)').order(amount: :desc).first
	
		@developer_ios_junior = Developer.where(title: 'iOS Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_ios_midlevel = Developer.where(title: 'iOS Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_ios_senior = Developer.where(title: 'iOS Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_ios_junior = Contract.where(name: 'iOS Developer (Junior)').order(amount: :desc).first
		@contract_ios_midlevel = Contract.where(name: 'iOS Developer (Mid-level)').order(amount: :desc).first
		@contract_ios_senior = Contract.where(name: 'iOS Developer (Senior)').order(amount: :desc).first
	
		@developer_android_junior = Developer.where(title: 'Android Developer (Junior)').order(min_contract_amount: :asc).first
		@developer__android_midlevel = Developer.where(title: 'Android Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer__android_senior = Developer.where(title: 'Android Developer (Senior)').order(min_contract_amount: :asc).first
		@contract__android_junior = Contract.where(name: 'Android Developer (Junior)').order(amount: :desc).first
		@contract__android_midlevel = Contract.where(name: 'Android Developer (Mid-level)').order(amount: :desc).first
		@contract__android_senior = Contract.where(name: 'Android Developer (Senior)').order(amount: :desc).first

		@developer_java_junior = Developer.where(title: 'Java Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_java_midlevel = Developer.where(title: 'Java Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_java_senior = Developer.where(title: 'Java Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_java_junior = Contract.where(name: 'Java Developer (Junior)').order(amount: :desc).first
		@contract_java_midlevel = Contract.where(name: 'Java Developer (Mid-level)').order(amount: :desc).first
		@contract_java_senior = Contract.where(name: 'Java Developer (Senior)').order(amount: :desc).first

		@developer_frontend_junior = Developer.where(title: 'Front-End Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_frontend_midlevel = Developer.where(title: 'Front-End Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_frontend_senior = Developer.where(title: 'Front-End Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_frontend_junior = Contract.where(name: 'Front-End Developer (Junior)').order(amount: :desc).first
		@contract_frontend_midlevel = Contract.where(name: 'Front-End Developer (Mid-level)').order(amount: :desc).first
		@contract_frontend_senior = Contract.where(name: 'Front-End Developer (Senior)').order(amount: :desc).first

		@developer_ui_ux_junior = Developer.where(title: 'UI/UX Developer (Junior)').order(min_contract_amount: :asc).first
		@developer_ui_ux_midlevel = Developer.where(title: 'UI/UX Developer (Mid-level)').order(min_contract_amount: :asc).first
		@developer_ui_ux_senior = Developer.where(title: 'UI/UX Developer (Senior)').order(min_contract_amount: :asc).first
		@contract_ui_ux_junior = Contract.where(name: 'UI/UX Developer (Junior)').order(amount: :desc).first
		@contract_ui_ux_midlevel = Contract.where(name: 'UI/UX Developer (Mid-level)').order(amount: :desc).first
		@contract_ui_ux_senior = Contract.where(name: 'UI/UX Developer (Senior)').order(amount: :desc).first

		@developer_project_manager_junior = Developer.where(title: 'Project Manager (Junior)').order(min_contract_amount: :asc).first
		@developer_project_manager_midlevel = Developer.where(title: 'Project Manager (Mid-level)').order(min_contract_amount: :asc).first
		@developer_project_manager_senior = Developer.where(title: 'Project Manager (Senior)').order(min_contract_amount: :asc).first
		@contract_project_manager_junior = Contract.where(name: 'Project Manager (Junior)').order(amount: :desc).first
		@contract_project_manager_midlevel = Contract.where(name: 'Project Manager (Mid-level)').order(amount: :desc).first
		@contract_project_manager_senior = Contract.where(name: 'Project Manager (Senior)').order(amount: :desc).first

		@developer_creative_director_junior = Developer.where(title: 'Creative Director (Junior)').order(min_contract_amount: :asc).first
		@developer_creative_director_midlevel = Developer.where(title: 'Creative Director (Mid-level)').order(min_contract_amount: :asc).first
		@developer_creative_director_senior = Developer.where(title: 'Creative Director (Senior)').order(min_contract_amount: :asc).first
		@contract_creative_director_junior = Contract.where(name: 'Creative Director (Junior)').order(amount: :desc).first
		@contract_creative_director_midlevel = Contract.where(name: 'Creative Director (Mid-level)').order(amount: :desc).first
		@contract_creative_director_senior = Contract.where(name: 'Creative Director (Senior)').order(amount: :desc).first

	end

end
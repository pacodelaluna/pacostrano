namespace :blank do

	desc "Pump the database with users, permissions and default ws"
	task :pump, :roles => :db do
		run "cd #{current_release} && rake blank:pump RAILS_ENV=#{rails_env}"
	end

	desc "Initialize the application"
	task :init do
		run "cd #{current_release} && rake blank:init RAILS_ENV=#{rails_env}"	
	end

	desc "Update some stuff on the application"
	task :update do
		run "cd #{current_release} && rake blank:update RAILS_ENV=#{rails_env}"
	end

	desc "Run a specific task for a son project (don't forget to define the task)"
	task :specific do
		run "cd #{current_release} && rake blank:specific RAILS_ENV=#{rails_env}"	
	end

end

namespace :db do

	desc "Create the database"
	task :create, :roles => :db do
		run "cd #{current_release} && rake db:create RAILS_ENV=#{rails_env}"
	end
	#after "deploy:update"

	desc "Migrate the database"
	task :migrate, :roles => :db do
		run "cd #{current_release} && rake db:migrate RAILS_ENV=#{rails_env}"
	end

	desc "Drop the database"
	task :drop, :roles => :db do
		run "cd #{current_release} && rake db:drop RAILS_ENV=#{rails_env}"
	end

	desc "Load fixtures"
	task :fixtures, :roles => :db do
		run "cd #{current_release} && rake db:fixtures:load RAILS_ENV=#{rails_env}"
	end

end

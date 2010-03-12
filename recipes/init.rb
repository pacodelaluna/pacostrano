namespace :init do
		
	desc "Create the Git repository"
	task :create_repo do
		p "Creating remote repository"
		run <<-CMD
			cd #{repo_folder} &&
			mkdir #{repo_name} &&
			cd #{repo_name} &&
			git --bare init
		CMD
		p "done"
		p "Doing the first commit and push"
		system <<-CMD
			cd .. && 
			mkdir #{repo_name} &&
			cd #{repo_name} &&
			git init &&
			git remote add origin #{repository} &&
			touch .gitignore &&
			git add .gitignore &&
			git commit -a -m "Init commit" &&
			git push origin master
		CMD
		p "done"
		
	end
	
	desc "Load Passenger configuration in Apache"
	task :load_passenger_conf do
		script = passenger_script
		put script, "/tmp/script.rb"
		run "ruby /tmp/script.rb"
		run "ln -s #{apache_conf_folder}/#{app_url} #{apache_conf_folder}/../sites-enabled/#{app_url}"
		run "rm /tmp/script.rb"
	end	

end

# To remove properly an appplication (files, db, apache)
namespace :clear do
	
	desc "Remove the application"
	task :default do
		drop_database
		delete_folder
	end
		
	desc "Delete the application files"
	task :delete_folders do
		run "rm -r #{app_folder}/#{app_name}"
	end
		
	desc "Drop the database"
	task :drop_database do
		run "rake db:drop"
	end
		
	desc "Delete Apache configuration files"
	task :unload_passenger_cong do
		run "rm #{apache_conf_folder}/#{app_url}"
		run "rm #{apache_conf_folder}/../sites-enabled/#{app_url}"
	end
	
end


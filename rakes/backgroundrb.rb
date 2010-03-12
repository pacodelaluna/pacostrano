namespace :backgroundrb do

	desc "Start BackGroundRB"
	task :start do
		run "#{current_path}/script/backgroundrb start -e #{rails_env}"
	end

	desc "Stop BackGroundRB"
	task :stop do
		run "#{current_path}/script/backgroundrb stop -e #{rails_env}"
	end

end

namespace :xapian do

	desc "Create and update Xapian index"
	task :default do
		create_index
		update_index
	end

	desc "Create XAPIAN index"
	task :create_index do
		run "cd #{current_release} && rake xapian:rebuild_index models='#{models_for_xapian}' RAILS_ENV=#{rails_env}"
	end
	
	desc "Update XAPIAN index"
	task :update_index do
		run "cd #{current_release} && rake xapian:update_index RAILS_ENV=#{rails_env}"
	end

end

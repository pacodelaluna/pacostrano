namespace :deploy do

  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
	# Defining the tasks to do after the deploy one
  after "deploy", "deploy:restart"

  [:start, :stop].each do |t|
    desc "#{t.to_s.capitalize} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end


  desc "Symlink more"
  task :symlink_more do
    symlink_folders.split(',').each do |folder|
			#run "rm #{latest_release}/#{folder}"
      run "ln -s #{shared_path}/#{folder} #{latest_release}/#{folder}"
      end
    end
  after "deploy:symlink", "deploy:symlink_more"


	desc "Setup more"
	task :setup_more, :except => { :no_release => true } do
		symlink_folders.split(',').each do |folder|
			run "mkdir -p #{shared_path}/#{folder}"
		end
	end
	after "deploy:setup", "deploy:setup_more"


	desc "Deploy colder, cold not enough"
	task :colder do
		transaction do
			update_code
			symlink
		end
	end


end
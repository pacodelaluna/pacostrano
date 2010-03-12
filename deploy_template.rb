# Application name
set :application, "app_name"

# SCM INFORMATION
set :scm, :git
#set :scm_command, '/home6/graphica/bin/git'
#set :scm_password, Proc.new { CLI.password_prompt "SVN Password: "}
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }

# REPOSITORY INFORMATION
set :repo_folder, '/home/git'
set :repo_name, "#{app_name}.git"
set :branch, ""
set :repo_user, ''
set :repo_url, ''
set :repository, "#{repo_user}@#{repo_url}:#{repo_folder}/#{repo_name}"
#set :local_repository, "."

# APPLICATION INFORMATION
server "IP or URL", :app, :web, :db, :primary => true
set :user, 'username'
set :use_sudo, false
set :deploy_to, "/path/to/repo/"
#set :apache_conf_folder, "/etc/apache2/sites-available"
set :app_name, ENV['APP_NAME']
set :rails_env, 'production'
#set :app_folder, '/home/rails'
set :local_root, ENV['RAILS_ROOT'] || "/home/obiwan/workspace/my_apps/blank_paco"
default_run_options[:pty] = true
#set :git_enable_submodules, 1
# Put the paths of the folders you want to share between each deployment (so they will be inside /shared folder on the server)
set :symlink_folders, 'public/uploaded_files,public/images/captcha'
#default_environment['PATH'] = "$PATH:~/bin"
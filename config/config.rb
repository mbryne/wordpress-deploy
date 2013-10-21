# application

set :application, "wordpress-deploy"

# server

server "www.mbryne.com", :web
set :user, "mbryne"
set :deploy_to, "/home/mbryne/website"

ssh_options[:keys] =  'C:/Projects/references/putty/mbryne_private.ppk'

# git

set :repository,  "https://github.com/mbryne/wordpress-deploy.git"
set :git_enable_submodules, 1

# database
set :wpdb do
	{
		:production => {
			:host     => 'PRODUCTION DB HOST',
			:user     => 'PRODUCTION DB USER',
			:password => 'PRODUCTION DB PASS',
			:name     => 'PRODUCTION DB NAME',
		},
		:staging => {
			:host     => 'STAGING DB HOST',
			:user     => 'STAGING DB USER',
			:password => 'STAGING DB PASS',
			:name     => 'STAGING DB NAME',
		}
	}
end


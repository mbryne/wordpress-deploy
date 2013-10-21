set :user, "mbryne"

set :application, "wordpress-deploy"
set :repository,  "https://github.com/mbryne/wordpress-deploy.git"

set :git_enable_submodules, 1

ssh_options[:forward_agent] = true
ssh_options[:keys] =  'C:/Projects/references/putty/mbryne_private.ppk'

set :scm, :git
set :deploy_to, "/home/mbryne/website"

set :deploy_via, :remote_cache
set :copy_exclude, [".git", ".DS_Store", ".gitignore", ".gitmodules"]

server "www.mbryne.com", :app
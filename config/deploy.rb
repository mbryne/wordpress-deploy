#   basic variables

set :scm, :git
set :deploy_via, :remote_cache
set :copy_exclude, [".git", ".DS_Store", ".gitignore", ".gitmodules"]
set :keep_releases, 5

#   custom variables

load 'config/config'

#   deployment process

before( "deploy", "git:submodule_tags" ) if git_enable_submodules

after "deploy:create_symlink", "wordpress:create_symlinks"
after "deploy:update_code", "db:make_config"
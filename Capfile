require 'railsless-deploy'

# Multistage
set :stages, ['production', 'development']
set :default_stage, 'production'
require 'capistrano/ext/multistage'

load 'config/tasks'
load 'config/deploy'

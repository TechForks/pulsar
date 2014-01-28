#
# Lock configuration to only use Capistrano 3.1
#
lock '3.1.0'

#
# Load DSL and Setup Up Stages
#
require 'capistrano/setup'

#
# Include default deployment tasks
#
require 'capistrano/deploy'

#
# Require everything and extend with additional modules
#
Bundler.require

extend Pulsar::Helpers::Capistrano

#
# Load default recipes
#
load_recipes do
  generic :cleanup, :utils
end

#
# Put here shared configuration that should be a default
# for all your apps
#

# set :scm, :git
# set :repo_url, defer { "git@github.com:your_gh_user/#{application}.git" }
# set :branch, "master"
# set :port, 22
# set :ssh_options, { user: "www-data", forward_agent: true }
# set :pty, true
# set :deploy_to, defer { "/var/www/#{application}" }
# set :deploy_via, :remote_cache
# set :user, "www-data"
# set :use_sudo, false
# set :rake, "bundle exec rake"
# set :rails_env, defer { "#{stage}" }
# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :keep_releases, 5

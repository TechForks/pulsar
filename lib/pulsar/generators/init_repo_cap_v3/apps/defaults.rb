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
# set :repo_url, proc { "git@github.com:your_gh_user/#{fetch(:application)}.git" }
# set :branch, "master"
# set :ssh_options, { user: "www-data", forward_agent: true, port: 22 }
# set :deploy_to, proc { "/var/www/#{fetch(:application)}" }
# set :rails_env, proc { fetch(:stage) }
# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :keep_releases, 5
# SSHKit.config.command_map[:rake] = "bundle exec rake"
# SSHKit.config.command_map[:rails] = "bundle exec rails"
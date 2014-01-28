namespace :utils do
  desc "Invoke your awesome rake tasks!"
  task :invoke_rake do
    on roles(:web) do
      run("cd #{deploy_to}/current && RAILS_ENV=#{rails_env} #{rake} #{ENV['ARGS']}")
    end
  end
end

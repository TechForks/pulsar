module Pulsar
  class InitCommand < UtilsCommand
    option [ "-c", "--capistrano-version" ], "VERSION", "which Capistrano version to use", :default => "2" do |v|
      version = Integer(v)

      [2, 3].include?(version) ? version : raise(ArgumentError)
    end

    parameter "CONFIGURATION_PATH", "where to generate your configuration repository"

    def execute
      with_clean_env_and_supported_vars do
        destination_path = File.expand_path(configuration_path)

        pulsar_cmd_path = File.expand_path(File.dirname(__FILE__))
        init_repo_path = "#{pulsar_cmd_path}/../generators/init_repo_cap_v#{capistrano_version}"

        init_repo_path += "/*" if File.directory?(destination_path)

        run_cmd("cp -r #{init_repo_path} #{destination_path}", :verbose => verbose?)

        puts "Your starter configuration repo is in #{destination_path.yellow}."
        puts "Remember to run #{ "bundle install".red } to add the needed Gemfile.lock."
      end
    end
  end
end

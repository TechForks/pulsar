# encoding: utf-8

if fetch(:log_level) == :warn
  arrow = "→".yellow.bold
  ok = "✓".green

  before "deploy:update_code", "cleanup:update_code" do
    SpinningCursor.start do
      banner "#{arrow} Updating Code"
      message "#{arrow} Updating Code #{ok}"
    end
  end

  before "bundle:install", "cleanup:bundle_install" do
    SpinningCursor.start do
      banner "#{arrow} Installing Gems"
      message "#{arrow} Installing Gems #{ok}"
    end
  end

  before "deploy:assets:symlink", "cleanup:symlink_assets" do
    SpinningCursor.start do
      banner "#{arrow} Symlinking Assets"
      message "#{arrow} Symlinking Assets #{ok}"
    end
  end

  before "deploy:assets:precompile", "cleanup:precompile_assets" do
    SpinningCursor.start do
      banner "#{arrow} Compiling Assets"
      message "#{arrow} Compiling Assets #{ok}"
    end
  end

  before "deploy:create_symlink", "cleanup:symlink" do
    SpinningCursor.start do
      banner "#{arrow} Symlinking Application"
      message "#{arrow} Symlinking Application #{ok}"
    end
  end

  before "deploy:restart", "cleanup:restart_webserver" do
    SpinningCursor.start do
      banner "#{arrow} Restarting Webserver"
      message "#{arrow} Restarting Webserver #{ok}"
    end
  end

  after "deploy", "cleanup:stop" do
    SpinningCursor.stop
  end
end

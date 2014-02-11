# encoding: utf-8

after "load:defaults", "cleanup" do
  if [ :warn, :error, :fatal ].include?(fetch(:log_level))
    arrow = "→".yellow.bold
    ok = "✓".green

    before "deploy:starting", "cleanup:starting" do
      SpinningCursor.start do
        banner "#{arrow} Starting Deploy"
        message "#{arrow} Starting Deploy #{ok}"
      end
    end

    after "deploy:started", "cleanup:started" do
      SpinningCursor.stop
    end

    before "deploy:publishing", "cleanup:publishing" do
      SpinningCursor.start do
        banner "#{arrow} Publishing Code"
        message "#{arrow} Publishing Code #{ok}"
      end
    end

    after "deploy:published", "cleanup:published" do
      SpinningCursor.stop
    end

    before "deploy:finishing", "cleanup:finishing" do
      SpinningCursor.start do
        banner "#{arrow} Cleaning Up"
        message "#{arrow} Cleaning Up #{ok}"
      end
    end

    after "deploy:finished", "cleanup:finished" do
      SpinningCursor.stop
    end
  end
end

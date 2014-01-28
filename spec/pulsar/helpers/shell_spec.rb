require 'spec_helper'

describe Pulsar::Helpers::Shell do
  include Pulsar::Helpers::Shell

  context "run_cmd" do
    it "raises exception if command fails" do
      expect { run_cmd("return 1", {}) }.to raise_error
    end

    it "doesn't raise an exception if :no_exception option is true" do
      expect { run_cmd("return 1", { no_exception: true }) }.not_to raise_error
    end

    it "returns the exit code of the command" do
      run_cmd("echo -n", {}).should == 0
    end
  end
end

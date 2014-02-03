require 'spec_helper'

describe Pulsar::Helpers::Shell do
  include Pulsar::Helpers::Shell

  context "run_cmd" do
    it "raises exception if command fails" do
      expect { run_cmd("false", {}) }.to raise_error
    end

    it "doesn't raise an exception if :no_exception option is true" do
      expect { run_cmd("false", { no_exception: true }) }.not_to raise_error
    end

    it "returns true if command is successful" do
      run_cmd("true", {}).should == true
    end

    it "returns false if command is not successful and if :no_exception option is true" do
      run_cmd("false", { no_exception: true }).should == false
    end

    it "returns false if command errors out and if :no_exception option is true" do
      run_cmd("does_not_exist", { no_exception: true }).should == false
    end
  end
end

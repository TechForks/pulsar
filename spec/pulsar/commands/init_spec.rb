require 'spec_helper'

describe Pulsar::InitCommand do
  let(:pulsar) { Pulsar::InitCommand.new("init") }
  let(:new_conf_path) { "#{tmp_path}/new-conf-repo" }
  let(:base_args) { [ new_conf_path ] }

  it "copies over the configuration repo for Capistrano v2" do
    expect { pulsar.run(base_args) }.to change{ Dir.glob(new_conf_path).length }.by(1)
    File.read("#{new_conf_path}/Gemfile").should include("gem 'capistrano', '~> 2.15'")
  end

  it "copies over the configuration repo for Capistrano v2" do
    expect { pulsar.run(%w(--capistrano-version 3) + base_args) }.to change{ Dir.glob(new_conf_path).length }.by(1)
    File.read("#{new_conf_path}/Gemfile").should include("gem 'capistrano', '~> 3.1'")
  end

  context "--capistrano-version option" do
    it "is supported" do
      expect { pulsar.parse(%w(--capistrano-version 2) + base_args) }.to_not raise_error(Clamp::UsageError)
    end

    it "supports only 2 and 3" do
      expect { pulsar.parse(%w(--capistrano-version 2) + base_args) }.to_not raise_error(Clamp::UsageError)
      expect { pulsar.parse(%w(--capistrano-version 3) + base_args) }.to_not raise_error(Clamp::UsageError)
      expect { pulsar.parse(%w(--capistrano-version 4) + base_args) }.to raise_error(Clamp::UsageError)
      expect { pulsar.parse(%w(--capistrano-version foobar) + base_args) }.to raise_error(Clamp::UsageError)
    end
  end
end

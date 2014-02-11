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

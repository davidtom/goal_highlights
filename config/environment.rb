require "bundler/setup"
Bundler.require

# Require main modules for app
require_all "app/"

# Require module to test/explore redd api
require_relative "../spec/exploratory/api_communicator.rb"

require "bundler/setup"

require "sinatra/activerecord"

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

# Require module to test/explore redd api
require_relative "../spec/exploratory/api_communicator.rb"

# Require main modules for app
require_all "app/"

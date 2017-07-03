ENV['SINATRA_ENV'] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV['SINATRA_ENV'])

require_all './app'
require_relative "../spec/exploratory/api_communicator.rb"

#NOTE: Things I commented out are those that are unnecessary based on the
# "ActiveRecord Setup in Sinatra" lab/reading. Keeping for now in case something
# breaks

# require "sinatra/activerecord"

# Bundler.require

# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

configure :development do
  set :database, 'sqlite3:db/database.db'
end

# connection_details = YAML::load(File.open('config/database.yml'))
# ActiveRecord::Base.establish_connection(connection_details)

# Require module to test/explore redd api
# require_relative "../spec/exploratory/api_communicator.rb"

# Require main modules for app
# require_all "app/"

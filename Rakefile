require 'sinatra/activerecord/rake'

task :default => :console

desc "Loads modules in ./config/environment.rb"
task :environment do
  require_relative "./config/environment"
end

desc "Opens a pry console after loading environment.rb. This is the default task."
task :console => :environment do
  Pry.start
end

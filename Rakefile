require_relative 'config/environment.rb'
require 'sinatra/activerecord/rake'

task :default => :console

desc "Opens a pry console after loading environment.rb. This is the default task."
task :console do
  Pry.start
end

task :run do
  sh "ruby bin/run"
end

task :scan_new do
  RedditAPIController.scan_new
  log_text = "#{DateTime.now} | RedditAPIController.scan_new completed successfully"
  puts log_text
end

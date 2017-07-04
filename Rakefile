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

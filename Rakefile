require File.join(File.dirname(__FILE__), 'lib/shedbot.rb')

unless ENV['RACK_ENV'] == 'production'
  require 'rspec/core/rake_task'
  require 'coveralls/rake/task'
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'

  RSpec::Core::RakeTask.new
  Coveralls::RakeTask.new

  task :default => [:spec, 'jasmine:ci', 'coveralls:push']
#  task :default => [:spec, 'coveralls:push']
end

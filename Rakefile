require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :environment do
  require_relative "boot"
end

require "resque/tasks"
task "resque:work" => :environment

require "resque/scheduler/tasks"
task "resque:scheduler" => :environment

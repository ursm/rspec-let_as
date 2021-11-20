require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: %i(spec readme)

RSpec::Core::RakeTask.new :spec

task :readme do
  sh 'handlematters README.md.hms > README.md'
end

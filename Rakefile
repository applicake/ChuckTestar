require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--color']
end

task :default => [:spec]

desc "Runs guard"
task :guard do
  sh "guard"
end
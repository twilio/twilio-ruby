require 'rubygems'
require 'rubygems/package_task'
require 'rspec/core/rake_task'

spec = eval(File.read('twilio-ruby.gemspec'))

Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
end

RSpec::Core::RakeTask.new do |t|
  t.pattern = 'test/*_spec.rb'
  t.rspec_opts = ['-c']
end

task :default => :spec
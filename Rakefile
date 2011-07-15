require 'rubygems'
require 'rake/gempackagetask'
require 'rspec/core/rake_task'

spec = eval(File.read('twilio-ruby.gemspec'))

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
end

RSpec::Core::RakeTask.new do |t|
  t.pattern = 'test/*_spec.rb'
  t.rspec_opts = ['-c']
end

task :default => :spec
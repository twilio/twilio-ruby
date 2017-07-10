require 'bundler'
Bundler.setup
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
desc 'Run all specs'
RSpec::Core::RakeTask.new(:spec)

task default: :spec
task test: :spec

task :authors do
  `make authors`
end

task :deploy, [:version] => [:spec, :authors] do |t, args|
  current_version = Twilio::VERSION

  if args.version.nil?
    version = Twilio::VERSION
    version_parts = version.split('.')
    increment = version_parts.pop
    increment_prefix = increment.split(/\d/)[0]

    increment = increment[increment_prefix.length..-1] if increment_prefix

    increment = increment.to_i + 1
    increment = "#{increment_prefix}#{increment}" if increment_prefix

    version = [*version_parts, increment].join('.')
  else
    version = args.version
  end

  puts("Deploying #{version}")

  # Update version.rb
  version_file = <<SRC
module Twilio
  VERSION = '#{version}'
end
SRC
  File.write('lib/twilio-ruby/version.rb', version_file)

  # Update README.md
  current_readme = File.read('README.md')
  new_readme = current_readme.gsub(Regexp.new(current_version.gsub('.', '\.')), version)
  File.write('README.md', new_readme)

  # Make a git commit
  `git commit -am "Bumping to version #{version}"`

  # Do the gem deployment
  `make gem`

  # Push the branch back up
  `git push`

  # Tag the branch
  `git tag #{version}`

  # Push the tags
  `git push --tags`
end

Gem::Specification.new do |s|
  s.name = "twilio-ruby"
  s.version = "1.0.0"
  s.author = "Andrew Benton"
  s.email = "andrew@twilio.com"
  s.description = "A simple library for communicating with the Twilio REST API"
  s.summary = "A simple library for communicating with the Twilio REST API"
  s.homepage = "http://github.com/twilio/twilio-ruby"
  s.platform = Gem::Platform::RUBY
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb'] + ['examples.rb', 'Rakefile', 'LICENSE', 'README.md', 'twilio-ruby.gemspec']
  s.test_files = Dir['test/**/*.rb']
  s.add_dependency("builder", ">= 2.1.2")
  s.add_dependency("crack", ">= 0.1.8")
end

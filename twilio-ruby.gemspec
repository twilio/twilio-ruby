Gem::Specification.new do |s|
  s.name = "twilio-ruby"
  s.version = "3.2.0"
  s.author = "Andrew Benton"
  s.email = "andrew@twilio.com"
  s.description = "A simple library for communicating with the Twilio REST API, building TwiML, and generating Twilio Client Capability Tokens"
  s.summary = "A simple library for communicating with the Twilio REST API, building TwiML, and generating Twilio Client Capability Tokens"
  s.homepage = "http://github.com/twilio/twilio-ruby"
  s.platform = Gem::Platform::RUBY
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb'] + ['examples.rb', 'Rakefile', 'LICENSE', 'README.md', 'twilio-ruby.gemspec']
  s.test_files = Dir['test/**/*.rb']
  s.add_dependency("json", ">= 1.2.0")
  s.add_dependency("builder", ">= 2.1.2")
  s.add_dependency("jwt", ">= 0.1.2")
end

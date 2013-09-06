install:
	gem build twilio-ruby.gemspec
	gem install twilio-ruby-*.gem

test-install:
	bundle install

test:
	bundle exec rake spec


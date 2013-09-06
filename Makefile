install:
	gem build twilio-ruby.gemspec
	gem install *.gem

test-install:
	bundle install

test:
	bundle exec rake spec


install:
	gem build twilio-ruby.gemspec
	gem install twilio-ruby-*.gem

test-install:
	bundle install

test:
	bundle exec rake spec

authors:
	echo "Authors\n=======\n\nA huge thanks to all of our contributors:\n\n" > AUTHORS.md
	git log --raw | grep "^Author: " | cut -d ' ' -f2- | cut -d '<' -f1 | sed 's/^/- /' | sort | uniq >> AUTHORS.md

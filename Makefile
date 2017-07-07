install:
	bundle install; bundle exec rake install

test-install:
	bundle install

test:
	bundle exec rake spec

docs:
	yard doc

lint:
	rubocop

authors:
	echo "Authors\n=======\n\nA huge thanks to all of our contributors:\n\n" > AUTHORS.md
	git log --raw | grep "^Author: " | cut -d ' ' -f2- | cut -d '<' -f1 | sed 's/^/- /' | sort | uniq >> AUTHORS.md

gem:
	bundle exec rake build | sed -e 's/.*pkg/pkg/g' | sed -e "s/\.$$//g" | xargs gem push

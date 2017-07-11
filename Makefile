.PHONY: test lint

install:
	@ruby --version || (echo "Ruby is not installed, please install Ruby >= 2"; exit 1);
	bundle install; bundle exec rake install

test-install:
	bundle install

test: lint
	bundle exec rake spec

docs:
	yard doc

lint:
	rubocop --cache true --parallel

authors:
	echo "Authors\n=======\n\nA huge thanks to all of our contributors:\n\n" > AUTHORS.md
	git log --raw | grep "^Author: " | cut -d ' ' -f2- | cut -d '<' -f1 | sed 's/^/- /' | sort | uniq >> AUTHORS.md

gem:
	bundle exec rake build | sed -e 's/.*pkg/pkg/g' | sed -e "s/\.$$//g" | xargs gem push

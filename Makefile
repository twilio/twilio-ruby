.PHONY: githooks install test lint docs docker-build docker-push

githooks:
	ln -sf ../../githooks/pre-commit .git/hooks/pre-commit

install:
	bundle install --with development; bundle exec rake install

test:
	bundle exec rake spec

docs:
	bundle exec yard doc --output-dir ./doc

authors:
	echo "Authors\n=======\n\nA huge thanks to all of our contributors:\n\n" > AUTHORS.md
	git log --raw | grep "^Author: " | cut -d ' ' -f2- | cut -d '<' -f1 | sed 's/^/- /' | sort | uniq >> AUTHORS.md

API_DEFINITIONS_SHA=$(shell git log --oneline | grep Regenerated | head -n1 | cut -d ' ' -f 5)
docker-build:
	docker build -t twilio/twilio-ruby .
	docker tag twilio/twilio-ruby twilio/twilio-ruby:${GITHUB_TAG}
	docker tag twilio/twilio-ruby twilio/twilio-ruby:apidefs-${API_DEFINITIONS_SHA}
	docker tag twilio/twilio-ruby twilio/twilio-ruby:latest

docker-push:
	docker push twilio/twilio-ruby:${GITHUB_TAG}
	docker push twilio/twilio-ruby:apidefs-${API_DEFINITIONS_SHA}
	docker push twilio/twilio-ruby:latest

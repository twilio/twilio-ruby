.PHONY: githooks test lint-changed lint docs

CHANGED_RUBY_FILES = $(shell git status --porcelain | grep ".rb" | awk -F ' ' '{print $2}' | tr '\n' ' ')

install: githooks
	bundle install; bundle exec rake install

test-install:
	bundle install

test: lint
	bundle exec rake spec

docs:
	yard doc --output-dir ./doc

lint:
	rubocop --cache true --parallel

githooks:
	cp githooks/pre-commit .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit

authors:
	echo "Authors\n=======\n\nA huge thanks to all of our contributors:\n\n" > AUTHORS.md
	git log --raw | grep "^Author: " | cut -d ' ' -f2- | cut -d '<' -f1 | sed 's/^/- /' | sort | uniq >> AUTHORS.md

gem:
	bundle exec rake build | sed -e 's/.*pkg/pkg/g' | sed -e "s/\.$$//g" | xargs gem push

API_DEFINITIONS_SHA=$(shell git log --oneline | grep Regenerated | head -n1 | cut -d ' ' -f 5)
docker-build:
	docker build -t twilio/twilio-ruby .
	docker tag twilio/twilio-ruby twilio/twilio-ruby:${TRAVIS_TAG}
	docker tag twilio/twilio-ruby twilio/twilio-ruby:apidefs-${API_DEFINITIONS_SHA}
	docker tag twilio/twilio-ruby twilio/twilio-ruby:latest

docker-push:
	echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
	docker push twilio/twilio-ruby:${TRAVIS_TAG}
	docker push twilio/twilio-ruby:apidefs-${API_DEFINITIONS_SHA}
	docker push twilio/twilio-ruby:latest

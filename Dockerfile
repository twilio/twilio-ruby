FROM ruby:2.4

RUN mkdir /twilio
WORKDIR /twilio

COPY . .

RUN bundle install
RUN bundle exec rake install

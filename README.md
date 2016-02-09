[![Gem Version](http://img.shields.io/gem/v/twilio-ruby.svg)][gem]
[![Build Status](http://img.shields.io/travis/twilio/twilio-ruby.svg)][travis]
[![Code Quality](http://img.shields.io/codeclimate/github/twilio/twilio-ruby.svg)][codeclimate]

# twilio-ruby

A module for using the Twilio REST API and generating valid [TwiML](http://www.twilio.com/docs/api/twiml/ "TwiML - Twilio Markup Language"). [Click here to read the full documentation.][documentation]

## Installation

To install using [Bundler][bundler] grab the latest stable version:

```ruby
gem 'twilio-ruby', '~> 5.0.0.rc2'
```

To manually install `twilio-ruby` via [Rubygems][rubygems] simply gem install:

```bash
gem install twilio-ruby -v 5.0.0.rc2
```

To build and install the development branch yourself from the latest source:

```bash
git clone git@github.com:twilio/twilio-ruby.git
cd twilio-ruby
make install
```

### Migration from 4.x
[Upgrade Guide][upgrade]

## Documentation
[Here][documentation]

## Feedback
During the Release Candidate period of this library, please leave all feedback and issues in the [Github Issues][issues] for `twilio-ruby`.

## Getting Started

### Setup Work

``` ruby
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

# and then you can create a new client without parameters
@client = Twilio::REST::Client.new
```

### Make a Call

``` ruby
@client.api.account.calls.create(
  from: '+14159341234',
  to: '+16105557069',
  url: 'http://example.com'
)
```

### Send an SMS

``` ruby
@client.api.account.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!'
)
```

### Customizing your HTTP Client
twilio-ruby uses [Faraday](https://github.com/lostisland/faraday) to make HTTP requests. You can tell Twilio::REST::Client to use any of the Faraday adapters like so:

```ruby
@client.http_client.adapter = :typhoeus
```

## Getting Started With Client Capability Tokens

If you just need to generate a Capability Token for use with Twilio Client, you
can do this:

``` ruby
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own account credentials here:
account_sid = 'AC043dcf9844e13758bc3a36a84c29761'
auth_token = '62ea81de3a5b413254eb263595357c69'

# set up
capability = Twilio::Util::Capability.new account_sid, auth_token

# allow outgoing calls to an application
capability.allow_client_outgoing 'AP89a0180a1a4ddf1da954efca349b7a20'

# allow incoming calls to 'andrew'
capability.allow_client_incoming 'andrew'

# generate the token string
@token = capability.generate
```

There is a slightly more detailed document in the [Capability][capability]
section of the wiki.

## Getting Started With TwiML

TwiML support is based on the [Builder][builder] library. You can construct a
TwiML response like this:

``` ruby
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# build up a response
response = Twilio::TwiML::Response.new do |r|
  r.Say 'hello there', voice: 'alice'
  r.Dial callerId: '+14159992222' do |d|
    d.Client 'jenny'
  end
end

# print the result
puts response.text
```

This will print the following (except for the whitespace):

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Say voice="alice">hello there</Say>
  <Dial callerId="+14159992222">
    <Client>jenny</Client>
  </Dial>
</Response>
```

## Supported Ruby Versions

This library supports and is [tested against][travis] the following Ruby
implementations:

- Ruby 2.2.0
- Ruby 2.1.0
- Ruby 2.0.0
- [JRuby][jruby]
- [Rubinius][rubinius]

[capability]: https://github.com/twilio/twilio-ruby/wiki/Capability
[builder]: http://builder.rubyforge.org/
[examples]: https://github.com/twilio/twilio-ruby/blob/master/examples
[documentation]: http://twilio.github.io/twilio-ruby
[wiki]: https://github.com/twilio/twilio-ruby/wiki
[bundler]: http://bundler.io
[rubygems]: http://rubygems.org
[gem]: https://rubygems.org/gems/twilio
[travis]: http://travis-ci.org/twilio/twilio-ruby
[codeclimate]: https://codeclimate.com/github/twilio/twilio-ruby
[jruby]: http://www.jruby.org
[rubinius]: http://rubini.us
[upgrade]: https://github.com/twilio/twilio-ruby/wiki/Ruby-Version-5.x-Upgrade-Guide
[issues]: https://github.com/twilio/twilio-ruby/issues

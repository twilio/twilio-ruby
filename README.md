# twilio-ruby

[![Build Status](http://img.shields.io/travis/twilio/twilio-ruby.svg)][travis]
[![Gem Version](http://img.shields.io/gem/v/twilio-ruby.svg)][gem]
[![Code Quality](http://img.shields.io/codeclimate/github/twilio/twilio-ruby.svg)][codeclimate]

A module for using the Twilio REST API and generating valid [TwiML](http://www.twilio.com/docs/api/twiml/ "TwiML - Twilio Markup Language"). [Click here to read the full documentation.][documentation]

## Recent Update

As of release 5.1.0, Beta and Developer Preview products are now exposed via
the main `twilio-java` artifact. Releases of the `alpha` branch have been
discontinued.

If you were using the `alpha` release line, you should be able to switch back
to the normal release line without issue.

If you were using the normal release line, you should now see several new
product lines that were historically hidden from you due to their Beta or
Developer Preview status. Such products are explicitly documented as
Beta/Developer Preview both in the Twilio docs and console, as well as through
in-line code documentation here in the library.


## Installation

To install using [Bundler][bundler] grab the latest stable version:

```ruby
gem 'twilio-ruby', '~> 5.2.0'
```

To manually install `twilio-ruby` via [Rubygems][rubygems] simply gem install:

```bash
gem install twilio-ruby -v 5.2.0
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

```ruby
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

```ruby
@client.api.account.calls.create(
  from: '+14159341234',
  to: '+16105557069',
  url: 'http://example.com'
)
```

### Send an SMS

```ruby
@client.api.account.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!'
)
```

### Customizing your HTTP Client
twilio-ruby uses [Faraday][faraday] to make HTTP requests. You can tell Twilio::REST::Client to use any of the Faraday adapters like so:

```ruby
@client.http_client.adapter = :typhoeus
```

## Getting Started With Client Capability Tokens

If you just need to generate a Capability Token for use with Twilio Client, you
can do this:

```ruby
require 'twilio-ruby'

# put your own account credentials here:
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# set up
capability = Twilio::JWT::ClientCapability.new account_sid, auth_token

# allow outgoing calls to an application
outgoing_scope = Twilio::JWT::ClientCapability::OutgoingClientScope.new 'AP11111111111111111111111111111111'
capability.add_scope(outgoing_scope)

# allow incoming calls to 'andrew'
incoming_scope = Twilio::JWT::ClientCapability::IncomingClientScope.new 'andrew'
capability.add_scope(incoming_scope)

# generate the token string
@token = capability.to_s
```

There is a slightly more detailed document in the [Capability][capability]
section of the wiki.

## Getting Started With TwiML

You can construct a TwiML response like this:

```ruby
require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new do |r|
  r.say('hello there', voice: 'alice')
  r.dial(caller_id: '+14159992222') do |d|
    d.client 'jenny'
  end
end

# print the result
puts response.to_s
```

This will print the following (except for the whitespace):

```xml
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

- Ruby 2.4.0
- Ruby 2.3.0
- Ruby 2.2.0
- Ruby 2.1.0
- Ruby 2.0.0

[capability]: https://github.com/twilio/twilio-ruby/wiki/Capability
[examples]: https://github.com/twilio/twilio-ruby/blob/master/examples
[documentation]: http://twilio.github.io/twilio-ruby
[wiki]: https://github.com/twilio/twilio-ruby/wiki
[bundler]: http://bundler.io
[rubygems]: http://rubygems.org
[gem]: https://rubygems.org/gems/twilio
[travis]: http://travis-ci.org/twilio/twilio-ruby
[codeclimate]: https://codeclimate.com/github/twilio/twilio-ruby
[upgrade]: https://github.com/twilio/twilio-ruby/wiki/Ruby-Version-5.x-Upgrade-Guide
[issues]: https://github.com/twilio/twilio-ruby/issues
[faraday]: https://github.com/lostisland/faraday

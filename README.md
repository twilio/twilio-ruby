[![Gem Version](http://img.shields.io/gem/v/twilio-ruby.svg)][gem]
[![Build Status](http://img.shields.io/travis/twilio/twilio-ruby.svg)][travis]
[![Code Quality](http://img.shields.io/codeclimate/github/twilio/twilio-ruby.svg)][codeclimate]

# twilio-ruby

A module for using the Twilio REST API and generating valid [TwiML](http://www.twilio.com/docs/api/twiml/ "TwiML - Twilio Markup Language"). [Click here to read the full documentation.][documentation]

## Installation

To install using [Bundler][bundler] grab the latest stable version:

```ruby
gem 'twilio-ruby', '~> 4.2.1'
```

To manually install `twilio-ruby` via [Rubygems][rubygems] simply gem install:

```bash
gem install twilio-ruby
```

To build and install the development branch yourself from the latest source:

```bash
git clone git@github.com:twilio/twilio-ruby.git
cd twilio-ruby
make install
```

## Getting Started With REST

### Setup Work

``` ruby
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
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

### Send an SMS

``` ruby
@client.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!'
)
```

### Send an MMS

``` ruby
@client.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!',
  media_url: 'http://example.com/smileyface.jpg'
)
```

### Do Some Stuff With Calls

``` ruby
# make a new outgoing call
@call = @client.calls.create(
  from: '+14159341234',
  to: '+18004567890',
  url: 'http://example.com/call-handler'
)

# hangup a ringing call, but don't touch it if it's connected
@call.cancel

# if you have the call sid, you can fetch a call object via:
@call = @client.calls.get('CA386025c9bf5d6052a1d1ea42b4d16662')

# redirect an in-progress call
@call.redirect_to('http://example.com/call-redirect')

# hangup a call, no matter whether it is ringing or connected
@call.hangup
```

### List Calls after a certain time

``` ruby
# list calls made or received on or after May 13, 2013
@client.calls.list("start_time>" => "2013-05-13") # Notice we omit the "=" in the "start_time>=" parameter because it is automatically added
```

### Buy a Phone Number

``` ruby
# print some available numbers
@numbers = @client.available_phone_numbers.get('US').local.list(
  contains: 'AWESOME'
)
@numbers.each {|num| puts num.phone_number}

# buy the first one
@number = @numbers[0].phone_number
@client.incoming_phone_numbers.create(phone_number: @number)
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

## Lookup Phone Number information

You can look up details on phone numbers with the Lookups API.

```ruby
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# set up a client to talk to the Twilio REST API
@lookups_client = Twilio::REST::LookupsClient.new account_sid, auth_token

# lookup a number
number = @lookups_client.phone_numbers.get('+14159341234')

# investigate the number
number.national_format
# => "(415) 934-1234"
number.country_code
# => "US"
```

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
- Ruby 1.9.3
- [JRuby][jruby]
- [Rubinius][rubinius]

## Getting help

If you need help installing or using the library, please contact Twilio Support at help@twilio.com first. Twilio's Support staff are well-versed in all of the Twilio Helper Libraries, and usually reply within 24 hours.

If you've instead found a bug in the library or would like new features added, go ahead and open issues or pull requests against this repo!

## More Information

There are more detailed examples in the included [examples][examples]
directory. Also for those upgrading, the [upgrade guide][upgrade] is available in the [twilio-ruby github wiki][wiki].

[capability]: https://github.com/twilio/twilio-ruby/wiki/Capability
[builder]: http://builder.rubyforge.org/
[examples]: https://github.com/twilio/twilio-ruby/blob/master/examples
[documentation]: http://twilio-ruby.readthedocs.org/en/latest
[upgrade]: https://github.com/twilio/twilio-ruby/wiki/UpgradeGuide
[wiki]: https://github.com/twilio/twilio-ruby/wiki
[bundler]: http://bundler.io
[rubygems]: http://rubygems.org
[gem]: https://rubygems.org/gems/twilio
[travis]: http://travis-ci.org/twilio/twilio-ruby
[codeclimate]: https://codeclimate.com/github/twilio/twilio-ruby
[jruby]: http://www.jruby.org
[rubinius]: http://rubini.us

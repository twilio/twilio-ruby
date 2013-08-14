[![Build Status](https://travis-ci.org/twilio/twilio-ruby.png?branch=master)](https://travis-ci.org/twilio/twilio-ruby)
[![Gem Version](https://badge.fury.io/rb/twilio-ruby.png)](http://badge.fury.io/rb/twilio-ruby)

## Install

Via rubygems.org:

```
$ gem install twilio-ruby
```

To build and install the development branch yourself from the latest source:

```
$ git clone git@github.com:twilio/twilio-ruby.git
$ cd twilio-ruby
$ git checkout develop
$ rake gem
$ gem install pkg/twilio-ruby-{version}
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
```

### Send an SMS

``` ruby
# send an sms
@client.account.sms.messages.create(
  :from => '+14159341234',
  :to => '+16105557069',
  :body => 'Hey there!'
)
```

### Do Some Stuff With Calls

``` ruby
# make a new outgoing call
@call = @client.account.calls.create(
  :from => '+14159341234',
  :to => '+18004567890',
  :url => 'http://example.com/call-handler'
)

# hangup a ringing call, but don't touch it if it's connected
@call.cancel

# if you have the call sid, you can fetch a call object via:
@call = @client.account.calls.get('CA386025c9bf5d6052a1d1ea42b4d16662')

# redirect an in-progress call
@call.redirect_to('http://example.com/call-redirect')

# hangup a call, no matter whether it is ringing or connected
@call.hangup
```

### List Calls after a certain time

``` ruby
# list calls made or received on or after May 13, 2013
@client.account.calls.list("start_time>" => "2013-05-13") # Notice we omit the "=" in the "start_time>=" parameter because it is automatically added
```

### Buy a Phone Number

``` ruby
# print some available numbers
@numbers = @client.account.available_phone_numbers.get('US').local.list(
  :contains => 'AWESOME'
)
@numbers.each {|num| puts num.phone_number}

# buy the first one
@number = @numbers[0].phone_number
@client.account.incoming_phone_numbers.create(:phone_number => @number)
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

TwiML support is based on the [builder][builder] library. You can construct a
TwiML response like this:

``` ruby
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# build up a response
response = Twilio::TwiML::Response.new do |r|
  r.Say 'hello there', :voice => 'alice'
  r.Dial :callerId => '+14159992222' do |d|
    d.Client 'jenny'
  end
end

# print the result
puts response.text
```

This will print the following (except for the whitespace):

```
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Say voice="alice">hello there</Say>
  <Dial callerId="+14159992222">
    <Client>jenny</Client>
  </Dial>
</Response>
```

## More Information

There are more detailed examples in the included [examples][examples]
directory.

Full [API documentation][documentation], as well as an [upgrade guide][upgrade]
for users of the old twiliolib gem, is available in the
[twilio-ruby github wiki][wiki].

[capability]:https://github.com/twilio/twilio-ruby/wiki/Capability
[builder]:http://builder.rubyforge.org/
[examples]:https://github.com/twilio/twilio-ruby/blob/master/examples
[documentation]:https://github.com/twilio/twilio-ruby/wiki/Documentation
[upgrade]:https://github.com/twilio/twilio-ruby/wiki/UpgradeGuide
[wiki]:https://github.com/twilio/twilio-ruby/wiki

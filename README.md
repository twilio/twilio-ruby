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

## Some Code To Get You Started

### Setup Work

``` ruby
require 'rubygems' # not necessary with ruby 1.9.2 but included for completeness
require 'twilio-ruby'

# put your own credentials here
@account_sid = 'AC043dcf9844e04758bc3a36a84c29761'
@auth_token = '62ea81de3a5b414154eb263595357c69'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(@account_sid, @auth_token)
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
  :url => 'http://myapp.com/call-handler'
)

# hangup a ringing call, but don't touch it if it's connected
@call.cancel

# if you have the call sid, you can fetch a call object via:
@call = @client.account.calls.get('CA386025c9bf5d6052a1d1ea42b4d16662')

# redirect an in-progress call
@call.redirect_to('http://myapp.com/call-redirect')

# hangup a call, no matter whether it is ringing or connected
@call.hangup
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
@account.incoming_phone_numbers.create(:phone_number => @number)
```

## More Information

There are more detailed examples in the included [examples.rb](twilio-ruby/blob/master/examples.rb).

Full [API documentation](twilio-ruby/wiki/Documentation), as well as an [upgrade guide](twilio-ruby/wiki/UpgradeGuide) for users of the old twiliolib gem, is available in the [twilio-ruby github wiki](twilio-ruby/wiki).
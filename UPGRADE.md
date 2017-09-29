# Upgrade Guide

_After `5.0.0` all `MINOR` and `MAJOR` version bumps will have upgrade notes
posted here._

[2017-09-29] 5.x.x to 5.3.x
---------------------------

### CHANGED - `Body` parameter on Chat `Message` creation is no longer required.

#### Rationale
This was changed to add support for sending media in Chat messages, users can now either provide a `body` or a `media_sid`.

#### 5.x.x
```ruby
require 'twilio-ruby'

@client = Twilio::REST::Client.new "AC123", "auth"
@client.chat.v2.service('IS123').channel('CH123').message.create("this is the body", "from")
```

#### 5.3.x
```ruby
require 'twilio-ruby'

@client = Twilio::REST::Client.new "AC123", "auth"
@client.chat.v2.service('IS123').channel('CH123').message.create("from", body:"this is the body")
```



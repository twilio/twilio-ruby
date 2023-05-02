# Upgrade Guide

_After `5.0.0` all `MINOR` and `MAJOR` version bumps will have upgrade notes
posted here._

[2023-05-03] 5.x.x to 6.x.x
-----------------------------
### Overview

##### Twilio Ruby Helper Library’s major version 6.0.0 is now available. We ensured that you can upgrade to Ruby helper Library 6.0.0 version without any breaking changes

Behind the scenes Ruby Helper is now auto-generated via OpenAPI with this release. This  enables us to rapidly add new features and enhance consistency across versions and languages.

To learn more about the Ruby Helper Library, check out [our docs](https://www.twilio.com/docs/libraries/ruby).

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



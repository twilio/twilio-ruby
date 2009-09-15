## Ruby Twilio Helper Library

### DESCRIPTION
The Twilio REST SDK simplifies the process of makes calls to the Twilio REST.
The Twilio REST API lets to you initiate outgoing calls, list previous call,
and much more.  See http://www.twilio.com/docs for more information.

### GEM
To install the Twilio GEM, follow these steps. Note: RubyGems 1.2.0 or greater required

    $ gem sources -a http://gems.github.com (you only have to do this once)
    $ sudo gem install twilio-twilio-ruby
    
More info at <http://gems.github.com/>

### NON-GEM
To use the twilio.rb library with Rails just copy the twilio.rb file
into the lib directory of your Rails application. Then just require
"twiliorest.rb" in the controller or code file you wish to use the Twilio REST
API from. 

### USAGE
As shown in example.rb, you will need to specify the ACCOUNT_ID and
ACCOUNT_TOKEN given to you by Twilio before you can make REST requests. In
addition, you will need to choose a 'Caller' and 'Called' before making
outgoing calls. See http://www.twilio.com/docs for more information.

### FILES
 * **lib/twilio.rb**: include this library in your code
 * **example-rest.rb**: example usage of REST
 * **example-twiml.rb**: example usage of the TwiML generator
 * **example-utils.rb**: example usage of utilities

### LICENSE
The Twilio Ruby Helper Library is distributed under the MIT License

### THANKS
 * Jay Philips (@adhearsion) for some great advice
 * Michael Ansel (@michaelansel) for a great starting point <http://github.com/michaelansel/twilio-rails/tree/master>
## Ruby Twilio Helper Library

### Description
The Twilio REST SDK simplifies the process of makes calls to the Twilio REST.
The Twilio REST API lets to you initiate outgoing calls, list previous call,
and much more.  See http://www.twilio.com/docs for more information.

### Gemcutter 

    $ sudo gem install twiliolib

### Manual Installation
To use the rake command to build the gem and

    $ sudo gem install /path/to/twiliolib/gem
    
to finish the installation

### Usage
As shown in examples, you will need to specify the ACCOUNT_ID and
ACCOUNT_TOKEN given to you by Twilio before you can make REST requests. In
addition, you will need to choose a 'Caller' and 'Called' before making
outgoing calls. See http://www.twilio.com/docs for more information.

### Files
 * **lib/twilio.rb**: include this library in your code
 * **examples/example-rest.rb**: example usage of REST
 * **examples/example-twiml.rb**: example usage of the TwiML generator
 * **examples/example-utils.rb**: example usage of utilities

### License
The Twilio Ruby Helper Library is distributed under the MIT License

### Thanks
 * Jay Philips (@adhearsion) for some great advice
 * Michael Ansel (@michaelansel) for a great starting point <http://github.com/michaelansel/twilio-rails/tree/master>
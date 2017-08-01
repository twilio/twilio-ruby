===========
Lookups API
===========

Lookups allows you to systematically ascertain information about phone numbers.
With Lookups, you can identify local-friendly number formats, reduce the
likelihood of undelivered messages and protect yourself from fraud.

For more information see the `Lookups API <https://www.twilio.com/docs/api/rest/lookups>`_ documentation.

Looking up details on a phone number
------------------------------------

You can look up a phone number with a :class:`Twilio::REST::Client`.

.. code-block:: ruby

    require "twilio-ruby"

    # Find these values at twilio.com/console
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new(account_sid, auth_token)

You can then use the client to lookup a phone number.

.. code-block:: ruby

    number = @client.lookups.phone_numbers("+12316851234").fetch
    number.country_code
    # => "US"
    number.phone_number
    # => "+12316851234"
    number.national_format
    # => "(231) 685-1234"
    number.url
    # => "https://lookups.twilio.com/v1/PhoneNumbers/+12316851234"

Invalid Phone Numbers
---------------------

The Lookups API is a REST API that returns data on phone number resources.
If you try to lookup a phone number that doesn't exist the API will raise a 404
:class:`Twilio::REST::RestError`. You should handle this within your code.

.. code-block:: ruby

    begin
      number = @client.lookups.phone_numbers("+15558675309").fetch
      puts number.phone_number
    rescue Twilio::REST::RestError => e
      raise e unless e.code == 20404 # ensure this is a 404 error
      puts "Invalid number"
    end

Carrier Information
-------------------

The Lookups API can be used to find out more information about the carrier for
the phone number. Just pass the type "carrier" to the request.

.. code-block:: ruby

    number = @client.lookups.phone_numbers("+12316851234").fetch(type: "carrier")
    number.carrier
    # => {"mobile_country_code"=>nil, "mobile_network_code"=>nil, "name"=>"Charter Fiberlink, LLC", "type"=>"landline", "error_code"=>nil}

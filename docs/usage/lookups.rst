===========
Lookups API
===========

Lookups allows you to systematically ascertain information about phone numbers. With Lookups, you can identify local-friendly number formats, reduce the likelihood of undelivered messages and protect yourself from fraud.

For more information see the `Lookups API <https://www.twilio.com/docs/api/rest/lookups>`_ documentation.

Looking up details on a phone number
------------------------------------

You can look up a phone number with a :class:`Twilio::REST::LookupsClient`. You instantiate the client as you would with any other :class:`Twilio::REST` client

.. code-block:: ruby

    require "twilio-ruby"

    # Find these values at twilio.com/user/account
    account_sid = "AC123123"
    auth_token = "secret"

    @lookups_client = Twilio::REST::LookupsClient.new account_sid, auth_token

You can then use the client to lookup a phone number.

.. code-block:: ruby

    response = @lookups_client.phone_numbers.get("+12316851234")
    response.country_code
    # => "US"
    response.phone_number
    # => "+12316851234"
    response.national_format
    # => "(231) 685-1234"
    response.url
    # => "https://lookups.twilio.com/v1/PhoneNumbers/+12316851234"

Invalid Phone Numbers
---------------------

The Lookups API is a REST API that returns data on phone number resources. If you try to lookup a phone number that doesn't exist the API will raise a 404 :class:`Twilio::REST::RequestError`. You should handle this within your code.

.. code-block:: ruby

    response = @lookups_client.phone_numbers.get("+15558675309")
    begin
      puts response.phone_number
    rescue Twilio::REST::RequestError => e
      raise e unless e.code == 20404 # ensure this is a 404 error
      puts "Invalid number"
    end

Carrier Information
-------------------

The Lookups API can be used to find out more information about the carrier for the phone number. Just pass the type "carrier" to the request.

.. code-block:: ruby

    response = @lookups_client.phone_numbers.get("+12316851234", type: "carrier")
    response.carrier
    # => {"mobile_country_code"=>nil, "mobile_network_code"=>nil, "name"=>"Charter Fiberlink, LLC", "type"=>"landline", "error_code"=>nil}

.. module:: twilio.rest.resources

=================
Caller Ids
=================


Validate a Phone Number
-----------------------

Validating a phone number is quick and easy.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @response = @client.outgoing_caller_ids.create(
      phone_number: "+44 9876543212"
    )
    puts @response.validation_code

Twilio will call the provided number and wait for the validation code to be
entered.

Delete a Phone Number
---------------------

Deleting a phone number is quick and easy.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @response = @client.outgoing_caller_ids.list(phone_number: "+15555555555")
    @callerid = response[0]
    @callerid.delete()

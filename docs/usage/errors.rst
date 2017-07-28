Error Handling
==============

Exceptions
----------
If the Twilio API returns a 400 or a 500 level HTTP response,
the twilio-ruby library will throw a :class:`Twilio::REST::RequestError`.
400-level errors are normal during API operation ("Invalid number",
"Cannot deliver SMS to that number", for example) and should be
handled appropriately.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    begin
      @client = Twilio::REST::Client.new account_sid, auth_token
      client.messages.create({
        from: '+1234567890',
        to: '+1234567890',
        body: 'Hello world'
      })
    rescue Twilio::REST::RequestError => e
      puts e.message
    end

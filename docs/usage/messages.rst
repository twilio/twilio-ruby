.. module:: twilio.rest.resources.sms_messages

============
Messages
============

For more information, see the
`Message REST Resource <http://www.twilio.com/docs/api/rest/message>`_
documentation.


Sending a Text Message
----------------------

Send a text message in only a few lines of code.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+13216851234",
      from: "+15555555555",
      body: "Hello!"
    )

If you want to send a message from a `short code
<http://www.twilio.com/api/sms/short-codes>`_ on Twilio, just set :attr:`from`
to your short code's number.


Sending a Picture Message
-------------------------

To send a picture, set :attr:`media_url` to the url of the picture you wish to send.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+15558676309",
      from: "+15555555555",
      body: "Jenny I need you!",
      media_url: "http://twilio.com/heart.jpg"
    )

You can send multiple pictures in the same message by setting :attr:`media_url` to
an array of urls.

.. code-block:: ruby

    @message = @client.messages.create(
      to: "+15558676309",
      from: "+15555555555",
      body: "Jenny I need you!",
      media_url: [
        "http://twilio.com/heart.jpg",
        "http://twilio.com/rose.jpg"
      ]
    )

Retrieving Sent Messages
-------------------------

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.list.each do |message|
      puts message.body
    end

Redacting or Deleting Messages
------------------------------

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @msg_sid = 'MM123'
    @msg = @client.messages.get('MM123')
    # Deletes the Body field contents
    @msg.redact

    # Removes the entire Message record
    @msg.delete

Filtering Your Messages
-------------------------

The :meth:`list` methods supports filtering on :attr:`to`, :attr:`from`,
and :attr:`date_sent`.
The following will only show messages to "+5466758723" on January 1st, 2011.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @messages = @client.messages.list(
      to: "+5466758723",
      date_sent: "2011-01-01"
    )

    @messages.each do |message|
      puts message.body
    end


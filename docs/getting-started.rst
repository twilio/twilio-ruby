===========
Quickstart
===========

Getting started with the Twilio API couldn't be easier. Create a Twilio REST
client to get started. For example, the following code makes a call using the
Twilio REST API.


Make a Call
===============

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @call = @client.calls.create(
      to: "9991231234",
      from: "9991231234",
      url: "http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient"
    )
    puts @call.length
    puts @call.sid


Send an SMS
===========

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+12316851234",
      from: "+15555555555",
      body: "Hello there!"
    )

Send an MMS
===========

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

Generating TwiML
=================

To control phone calls, your application needs to output `TwiML
<http://www.twilio.com/docs/api/twiml/>`_. Use :class:`twilio.twiml.Response`
to easily create such responses.

.. code-block:: ruby

    Twilio::TwiML::Response do |r|
        r.Play "https://api.twilio.com/cowbell.mp3", loop: 5
    end.text

.. code-block:: xml

    <?xml version="1.0" encoding="utf-8"?>
    <Response>
        <Play loop="5">https://api.twilio.com/cowbell.mp3</Play>
    <Response>


Digging Deeper
========================

The full power of the Twilio API is at your fingertips. The :ref:`user-guide`
explains all the awesome features available to use.


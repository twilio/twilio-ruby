.. module:: twilio.rest.resources

================
Transcriptions
================

Transcriptions are generated from recordings via the
`TwiML <Record> verb <http://www.twilio.com/docs/api/twiml/record>`_.
Using the API, you can only read your transcription records.

For more information, see the `Transcriptions REST Resource
<http://www.twilio.com/docs/api/rest/transcription>`_ documentation.


Listing Your Transcriptions
----------------------------

The following code will print out the length of each :class:`Transcription`.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.transcriptions.list().each do |transcription|
      puts transcription.duration
    end


.. _usage-twiml:

.. module:: twilio.twiml

==============
TwiML Creation
==============

Voice TwiML creation begins with the :class:`VoiceResponse` verb.
Each successive verb is created by calling various methods on the response,
such as :meth:`say` or :meth:`play`.
These methods return the verbs they create to ease creation of nested TwiML.
To finish, call the :meth:`to_s` method on the :class:`Response`,
which returns raw TwiML.

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio::TwiML::VoiceResponse.new do |r|
      r.say("Hello")
    end.to_s

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <Response><Say>Hello</Say><Response>

The verb methods (outlined in the :doc:`complete reference </api/twiml>`)
take the body (only text) of the verb as the first argument.
All attributes are keyword arguments.

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio::TwiML::VoiceResponse.new do |r|
      r.play(url: "https://api.twilio.com/cowbell.mp3", loop: 5)
    end.to_s

.. code-block:: xml

    <?xml version="1.0" encoding="utf-8"?>
    <Response>
      <Play loop="3">https://api.twilio.com/cowbell.mp3</Play>
    <Response>

Any example of nesting nouns in verbs

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio::TwiML::VoiceResponse.new do |r|
      r.say("Hello")
      r.gather(finish_on_key: 4) do |g|
        g.say("World")
      end
    end.to_s

which returns the following

.. code-block:: xml

    <?xml version="1.0" encoding="utf-8"?>
    <Response>
      <Say>Hello</Say>
      <Gather finishOnKey="4"><Say>World</Say></Gather>
    </Response>

And an example using :class:`MessagingResponse`

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio::TwiML::MessagingResponse.new do |r|
      r.message(body: "Hello")
    end.to_s

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <Response><Message>Hello</Message></Response>

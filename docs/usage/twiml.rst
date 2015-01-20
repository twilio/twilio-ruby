.. _usage-twiml:

.. module:: twilio.twiml

==============
TwiML Creation
==============

TwiML creation begins with the :class:`Response` verb.
Each successive verb is created by calling various methods on the response,
such as :meth:`say` or :meth:`play`.
These methods return the verbs they create to ease creation of nested TwiML.
To finish, call the :meth:`toxml` method on the :class:`Response`,
which returns raw TwiML.

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio::TwiML::Response.new do |r|
      r.Say "Hello"
    end.text

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <Response><Say>Hello</Say><Response>

The verb methods (outlined in the :doc:`complete reference </api/twiml>`)
take the body (only text) of the verb as the first argument.
All attributes are keyword arguments.

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio::TwiML::Response.new do |r|
      r.Play "https://api.twilio.com/cowbell.mp3", loop: 5
    end.text

.. code-block:: xml

    <?xml version="1.0" encoding="utf-8"?>
    <Response>
      <Play loop="3">https://api.twilio.com/cowbell.mp3</Play>
    <Response>

Any example of nesting nouns in verbs

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio::TwiML::Response.new do |r|
      r.Say "hello"
      r.Gather finishOnKey: => 4 do |g|
        g.Say "world"
      end
    end.text

which returns the following

.. code-block:: xml

    <?xml version="1.0" encoding="utf-8"?>
    <Response>
      <Say>Hello</Say>
      <Gather finishOnKey="4"><Say>World</Say></Gather>
    </Response>

.. module:: twilio.rest
.. _phone-calls:

=====================
Phone Calls
=====================

The :class:`Calls` resource manages all interaction with Twilio phone calls,
including the creation and termination of phone calls.


Making a Phone Call
-------------------

The :class:`Calls` resource allows you to make outgoing calls. Before a call
can be successfully started, you'll need a to set up a url endpoint which
outputs valid `TwiML <http://www.twilio.com/docs/api/twiml/>`_.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @call = @client.calls.create(
      to: "9991231234",
      from: "9991231234",
      url: "http://foo.com/call.xml"
    )
    puts @call.length
    puts @call.sid


Retrieve a Call Record
-------------------------

If you already have a :class:`Call` sid,
you can use the client to retrieve that record.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    sid = "CA12341234"
    @call = @client.calls.get(sid)

Delete a Call Record
--------------------

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    sid = "CA12341234"
    @call = @client.calls.get(sid)

    # Removes the entire record from Twilio's storage
    @call.delete

Accessing Specific Call Resources
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Each :class:`Call` resource also has access to its `notifications`,
`recordings`, and `transcriptions`.
These attributes are :class:`ListResources`,
just like the :class:`Calls` resource itself.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    sid = "CA12341234"
    @call = @client.calls.get(sid)

    puts @call.notifications.list()
    puts @call.recordings.list()
    puts @call.transcriptions.list()

However, what if you only have a `CallSid`, and not the actual
:class:`Resource`? No worries, as :meth:`list` can be filter based on a given
`CallSid`.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    sid = "CA24234"
    puts @client.notifications.list(call: sid)
    puts @client.recordings.list(call: sid)
    puts @client.transcriptions.list(call: sid)


Modifying Live Calls
--------------------

The :class:`Call` resource makes it easy to find current live calls and
redirect them as necessary

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @calls = @client.calls.list(status: "in-progress")

    @calls.each do |call|
      call.redirect_to("http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient")
    end


Ending all live calls is also possible

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @calls = @client.calls.list(status: "in-progress")

    @calls.each do |call|
      call.hangup()
    end

Note that :meth:`hangup` will also cancel calls currently queued.

If you already have a :class:`Call` sid, you can use the :class:`Calls`
resource to update the record without having to use :meth:`get` first.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    sid = "CA12341234"
    @client.calls.get(sid).redirect_to("http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient")

Hanging up the call also works.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    sid = "CA12341234"
    @client.calls.get(sid).hangup()


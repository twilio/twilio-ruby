.. module:: twilio.rest.resources

==============================
Conferences and Participants
==============================

For more information, see the `Conference REST Resource <http://www.twilio.com/docs/api/rest/conference>`_
and `Participant REST Resource <http://www.twilio.com/docs/api/rest/participant>`_ documentation.


Listing Conferences
-----------------------

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @conferences = @client.conferences.list()

    @conferences.each do |conference|
      puts conference.sid
    end


Filtering Conferences
-----------------------

The :meth:`Twilio::REST::Conferences.list` method supports filtering on :attr:`status`,
:attr:`date_updated`, :attr:`date_created` and :attr:`friendly_name`. The following code
will return a list of all in-progress conferences and print their friendly name.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @conferences = @client.conferences.list(status: "in-progress")

    @conference.each do |conference|
      puts conference.friendly_name
    end


Listing Participants
----------------------

Each :class:`Conference` has a :attr:`participants` instance which represents all current users in the conference

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @conference = @client.conferences.get("CF123")

    @conference.participants.list.each.do |paricipant|
      puts participant.sid
    end

:class:`Conferences` and :class:`Participants` are subclasses of :class:`ListResource`.
Therefore, their instances have the inherited methods such as :meth:`count`.


Managing Participants
----------------------

Each :class:`Conference` has a :attr:`participants` function that returns a
:class:`Participants` instance. This behavior differs from other list resources
because :class:`Participants` needs a participant sid AND a conference sid to
access the participants resource.

Participants can be either muted or kicked out of the conference. The following
code kicks out the first participant and mutes the rest.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @participants = @client.conferences.get("CF123").participants.list()

    return if @participants.empty?

    # Kick the first person out
    @participants.pop().kick()

    # And mute the rest
    @participants.each do |participant|
      participant.mute()
    end


.. module:: twilio.rest.resources

==============================
Queues and Members
==============================

For more information, see the
`Queue REST Resource <http://www.twilio.com/docs/api/rest/queue>`_
and `Member REST Resource <http://www.twilio.com/docs/api/rest/member>`_
documentation.


Listing Queues
-----------------------

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @queues = @client.queues.list

    @queues.each do |queue|
      puts queue.sid
    end


Listing Queue Members
----------------------

Each :class:`Queue` has a :attr:`members` instance which
represents all current calls in the queue.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @queue = @client.queues.get("QU123")

    @queue.members.list().each do |member|
      puts member.call_sid
    end


Getting a specific Queue Member
-------------------------------

To retrieve information about a specific member in the queue, each
:class:`Members` has a :attr:`get` method. :attr:`get` accepts one
argument. The argument can either be a `call_sid` thats in the queue,
in which case :attr:`get` will return a :class:`Member` instance
representing that call, or the argument can be 'Front', in which case
:attr:`Get` will return a :class:`Member` instance representing the
first call in the queue.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    queue_sid = "QUAAAAAAAAAAAAA"
    call_sid = "CAXXXXXXXXXXXXXX"

    @members = @client.queues.get(queue_sid).members

    # Get the first call in the queue
    puts members.front.date_enqueued

    # Get the call with the given call sid in the queue
    puts members.get(call_sid).current_position


Dequeueing Queue Members
------------------------

To dequeue a specific member from the queue, each
:class:`Members` has a :attr:`dequeue` method. :attr:`dequeue` accepts an
argument and two optional keyword arguments. The first argument is the
url of the twiml document to be executed when the member is
dequeued. The other two are :attr:`call_sid` and :attr:`method`, their
default values are 'Front' and 'GET'

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    queue_sid = "QUAAAAAAAAAAAAA"

    @members = @client.queues.get(queue_sid).members

    # Dequeue the first call in the queue
    puts @members.dequeue('http://www.twilio.com/welcome/call')

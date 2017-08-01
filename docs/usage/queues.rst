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

    # To find these visit https://www.twilio.com/console
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new(account_sid, auth_token)
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

    # To find these visit https://www.twilio.com/console
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @queue = @client.queues("QU123")

    @queue.members.list().each do |member|
      puts member.call_sid
    end


Getting a specific Queue Member
-------------------------------

To retrieve information about a specific member in the queue, each
:class:`Members` can be initialized with a value then followed by
the method :attr:`fetch`. If :class:`Members` is initialized with
a `call_sid`, :attr:`fetch` will return a :class:`Member` instance
representing that call. If, in the other hand, we use 'Front' value
to initialize the class, :attr:`fetch` will return a :class:`Member`
instance representing the first call in the queue.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/console
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    queue_sid = "QUAAAAAAAAAAAAA"
    call_sid = "CAXXXXXXXXXXXXXX"

    @queue = @client.queues(queue_sid)

    # Get the first call in the queue
    puts @queue.members('Front').fetch.date_enqueued

    # Get the call with the given call sid in the queue
    puts @queue.members(call_sid).fetch.current_position



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

    # To find these visit https://www.twilio.com/console
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    queue_sid = "QUAAAAAAAAAAAAA"

    @queue = @client.queues(queue_sid)

    # Dequeue the first call in the queue
    member = @queue.members('Front').fetch

    @member.update(
      url: 'http://www.twilio.com/welcome/call',
      method: 'POST'
    )

    puts @member.position

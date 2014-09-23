.. module:: twilio.rest

=========================
Accessing REST Resources
=========================

To access Twilio REST resources, you'll first need to instantiate a
:class:`Twilio::REST::Client`.

Authentication
--------------------------

The :class:`Twilio::REST::Client` needs your Twilio credentials. To get
your credentials, visit `your Twilio account portal
<https://www.twilio.com/user/account>`_. If you don't have a Twilio account
yet, go `here <https://www.twilio.com/try-twilio>`_ to get started.

Once you have your credentials, you can create create a new :class:`Client` and get started.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

You can also configure the client using the top level configure method, like so:

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio.configure do |config|
      config.account_sid = "ACXXXXXXXXXXXXXXXXX"
      config.auth_token = "YYYYYYYYYYYYYYYYYY"
    end

    @client = Twilio::REST::Client.new


Listing Resources
-------------------

The :class:`Client` gives you access to various list resources.
:meth:`ListResource.list`, by default, returns the most recent 50 instance resources.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
	@calls = @client.calls.list()

:meth:`ListResource.list` accepts paging arguments.
The following will return page 3 with page size of 25.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
	@calls = @client.calls.list(page: 3, page_size: 25)


Get an Individual Resource
-----------------------------

To get an individual instance resource, use :meth:`ListResource.get`.
Provide the :attr:`sid` of the resource you'd like to get.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @call = @client.calls.get("CA123")
    puts @call.to


Deleting a Resource
-------------------------------

Resources can only be deleted via their instance object. This means
you must instantiate an instance object using :meth:`ListResource.get`
and then call :meth:`delete` on it.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @recording = @client.recordings.get("RC123")
    @recording.delete()


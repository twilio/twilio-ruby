.. module:: twilio.rest.resources

====================
Notifications
====================

For more information, see the `Notifications REST Resource
<http://www.twilio.com/docs/api/rest/notification>`_ documentation.


Listing Your Notifications
----------------------------

The following code will print out additional information about each of your
current :class:`Notification` resources.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.notifications.list().each do |notification|:
        puts notification.more_info

You can filter transcriptions by :attr:`log` and :attr:`message_date`.
The :attr:`log` value is 0 for `ERROR` and 1 for `WARNING`.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    ERROR = 0

    @client.account.notifications.list(log=ERROR).each do |notification|:
        puts notification.error_code

.. note:: Due to the potentially voluminous amount of data in a notification,
    the full HTTP request and response data is only returned in the
    :class:`Notification` instance resource representation.


Deleting Notifications
------------------------

Your account can sometimes generate an inordinate amount of
:class:`Notification` resources. The :class:`Notifications` resource allows
you to delete unnecessary notifications.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.notifications.get("NO123").delete()


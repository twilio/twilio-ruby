=============
Sip In
=============

Getting started with Sip In
===========================

If you're unfamiliar with SIP, please see the `SIP API Documentation
<https://www.twilio.com/docs/api/rest/sip>`_ on our website. If you want
to make a regular phone call, take a look at :doc:`phone-calls`.

Creating a Sip Domain
=====================

The :class:`Domains` resource allows you to create a new domain. To
create a new domain, you'll need to choose a unique domain that lives
under sip.twilio.com.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @domain = @client.sip.domains.create(
      friendly_name: "The Office Domain",
      voice_url: "http://example.com/voice"
      domain_name: "dunder-mifflin-scranton.sip.twilio.com"
    )
    puts @domain.sid

Creating a new IpAccessControlList
==================================

To control access to your new domain, you'll need to explicitly grant access
to individual ip addresses. To do this, you'll first need to create an
:class:`IpAccessControlList` to hold the ip addresses you wish to allow.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @ip_acl = @client.sip.ip_access_control_lists.create(
      friendly_name: "The Office IpAccessControlList"
    )
    puts @ip_acl.sid

Adding a new IpAddress
=========================

Now it's time to add an :class:`IpAddress` to your new :class:`IpAccessControlList`.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @ip_address = @client.sip.ip_access_control_lists.get(
      "AL456",  # IpAccessControlList sid
    ).ip_addresses.create(
      friendly_name: "Dwights's Computer",
      ip_address: "192.168.1.42"
    )
    puts @ip_address.sid

Adding an IpAccessControlList to a Domain
===========================================

Once you've created a :class:`Domain` and an :class:`IpAccessControlList` you need to
associate them. To do this, create an :class:`IpAccessControlListMapping`.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @ip_acl_mapping = @client.sip.domains.get(
      "SD456",  # SIP Domain sid
    ).ip_access_control_list_mappings.create(
      ip_access_control_list_sid: "AL789"
    )

    puts @ip_acl_mapping.sid


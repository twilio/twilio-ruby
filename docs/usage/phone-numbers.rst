.. module:: twilio.rest.resources

=================
Phone Numbers
=================

With Twilio you can search and buy real phone numbers, just using the API.

For more information, see the
`IncomingPhoneNumbers REST Resource
<http://www.twilio.com/docs/api/rest/incoming-phone-numbers>`_ documentation.


Searching and Buying a Number
--------------------------------

Finding numbers to buy couldn't be easier.
We first search for a US number in area code 530.
Once we find one, we'll purchase it for our account.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    numbers = @client.available_phone_numbers.get('US').list(area_code: "530")

    if numbers.any?
      numbers[0].purchase()
    else
      puts "No numbers in 530 available"
    end


Local, Toll-Free, and Mobile Numbers
------------------------------------

By default, :meth:`PhoneNumbers.search` looks for local phone numbers. You can
search for different types of numbers by using a type subresource.

Available subresources for AvailablePhoneNumbers are:
- `local`
- `toll_free`
- `mobile`

You can search for numbers for a given type.

.. code-block:: ruby

    # local
    numbers = @client.available_phone_numbers.get('US').local.list()

    # toll free
    numbers = @client.available_phone_numbers.get('US').toll_free.list()

    # mobile
    numbers = @client.available_phone_numbers.get('UK').mobile.list()

Numbers Containing Words
^^^^^^^^^^^^^^^^^^^^^^^^^^

Phone number search also supports looking for words inside phone numbers.
The following example will find any phone number with "FOO" in it.

.. code-block:: ruby

    numbers = @client.available_phone_numbers.get('US').list(contains: "FOO")

You can use the ''*'' wildcard to match any character. The following example finds any phone number that matches the pattern ''D*D''.

.. code-block:: ruby

    numbers = @client.available_phone_numbers.get('US').list(contains: "D*D")

Other Number Searches
^^^^^^^^^^^^^^^^^^^^^

:meth:`PhoneNumbers.search` method has plenty of other options to augment your search :

- :data:`region`: When searching the US, show numbers in this state
- :data:`postal_code`: Only show numbers in this area code
- :data:`rate_center`: US only.
- :data:`near_lat_long`: Find numbers near this latitude and longitude.
- :data:`distance`: Search radius for a Near- query in miles.
- :data:`beta`: Include or exclude numbers that are new to the Twilio platform.

The `AvailablePhoneNumbers REST Resource
<http://www.twilio.com/docs/api/rest/available-phone-numbers>`_ documentation
has more information on the various search options.

Numbers Requiring Addresses
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Some phone numbers require you to have an address on file with Twilio to satisfy legal
requirements before they can be purchased. By default, the client library will
include numbers in the result lists regardless of their address requirements; you can
filter these numbers out when searching for phone numbers to purchase.

.. code-block:: ruby

    # Exclude all numbers requiring addresses
    numbers = @client.available_phone_numbers.get('AU').list(exclude_all_address_required: true)

    # Exclude numbers requiring local addresses
    numbers = @client.available_phone_numbers.get('AU').list(exclude_local_address_required: true)

    # Exclude numbers requiring foreign addresses
    numbers = @client.available_phone_numbers.get('AU').list(exclude_foreign_address_required: true)


Buying a Number
---------------

If you've found a phone number you want, you can purchase the number.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @number = @client.available_phone_numbers.purchase(
      phone_number: "+15305431234"
    )

However, it's easier to purchase numbers after finding them using search (as
shown in the first example).


Updating Properties on a Number
-------------------------------

To update the properties on a phone number, call :meth:`update`
on the phone number object, with any of the parameters
listed in the `IncomingPhoneNumbers Resource documentation
<http://www.twilio.com/docs/api/rest/incoming-phone-numbers>`_

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.available_phone_numbers.list.each do |number|
      number.update(
        voice_url: "http://twimlets.com/holdmusic?" \
                   "Bucket=com.twilio.music.ambient",
        status_callback: "http://example.com/callback"
      )
    end

Changing Applications
----------------------

An :class:`Application` encapsulates all necessary URLs for use with phone numbers. Update an application on a phone number using :meth:`update`.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token

    phone_sid = "PNXXXXXXXXXXXXXXXXX"

    @number = @client.available_phone_numbers.get(phone_sid)
    @number.update(sms_application_sid: "APXXXXXXXXXXXXXXXXXX")

See :doc:`/usage/applications` for instructions on updating and maintaining Applications.


Validate a Phone Number
-----------------------

See validation instructions here: :doc:`/usage/caller-ids`:


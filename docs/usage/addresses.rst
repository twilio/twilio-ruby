.. module:: twilio.rest.resources

=========
Addresses
=========

An Address instance resource represents your or your customer’s physical
location within a country. Around the world, some local authorities require the
name and address of the user to be on file with Twilio to purchase and own a
phone number.

For more information, see the `Address REST Resource
<http://www.twilio.com/docs/api/rest/address`_ documentation.

Creating an Address
-------------------

Addresses contain the name of your company or your customer’s company in
addition to location information and an optional friendly name.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @address = @client.addresses.create(
      friendly_name: "Homer",
      customer_name: "Homer Simpson",
      street: "742 Evergreen Terrace",
      city: "Springfield",
      region "IL",
      postal_code: "62701",
      iso_country: "US"
    )

Listing Addresses
-----------------

The following code will print out the :attr:`customer_name` for each :class:`Address`.

.. code-block:: ruby

    @addresses = @client.addresses.list()
    @addresses.each do |address|
      puts address.customer_name
    end

Filtering Addresses
-------------------

The list of Addresses can be filtered on :attr:`friendly_name`,
:attr:`customer_name`, and/or :attr:`iso_country`.

.. code-block:: ruby

    @addresses = @client.addresses.list(iso_country: 'AU')
    @addresses.each do |address|
      puts address.customer_name
    end

Updating an Address
-------------------

All Address attributes other than :attr:`iso_country` can be updated.
To create an Address with a different country, see the "Creating an Address" section.

.. code-block:: ruby

    @sid = 'AD123' # the address you'd like to update
    @address = @client.addresses.get(@sid)
    @address.update(customer_name: "Marge Simpson")

Deleting an Address
-------------------

.. code-block:: ruby

    address_sid = 'AD123'
    @address = @client.addresses.get(address_sid)
    @address.delete()

Listing Dependent Phone Numbers
-------------------------------

Twilio will not permit you to delete an Address if it is the sole
Address resource on your account that satisfies the address requirements
for one or more of your purchased phone numbers.

To see which phone numbers depend on a given address:

.. code-block:: ruby

    address_sid = 'AD123'
    @address = @client.addresses.get(address_sid)
    @address.dependent_phone_numbers.list.each do |number|
      puts number.sid
    end

.. module:: twilio.rest.pricing

======================================
Accessing Twilio Pricing API Resources
======================================

To access Twilio Pricing resources, you'll first need to instantiate a
:class:`Twilio::REST::PricingClient`.


Authentication
--------------

The :class:`Twilio::REST::PricingClient` needs your Twilio credentials. To get
your credentials, visit `your Twilio account portal
<https://www.twilio.com/user/account>`_. If you don't have a Twilio account
yet, go `here <https://www.twilio.com/try-twilio>`_ to get started.

Once you have your credentials, you can create create a new :class:`PricingClient` and get started.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::PricingClient.new account_sid, auth_token

You can also configure the client using the top level configure method, like so:

.. code-block:: ruby

    require 'twilio-ruby'

    Twilio.configure do |config|
      config.account_sid = "ACXXXXXXXXXXXXXXXXX"
      config.auth_token = "YYYYYYYYYYYYYYYYYY"
    end

    @client = Twilio::REST::PricingClient.new


=============
Voice Pricing
=============

Twilio Voice pricing information is available by country and by phone number.

Voice calls are priced per minute and reflect the current Twilio list price
and any discounts available to the requesting account at the time of the
request.

Voice Countries
---------------

To retrieve a list of countries where Twilio Voice services are available:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::PricingClient.new account_sid, auth_token
    @countries = @client.voice.countries.list
    @countries.each do |c|
        puts c.country
    end

Note that the country objects in the returned list will not have pricing
information populated; you will need to retrieve the specific information
for each country you are interested in individually:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::PricingClient.new account_sid, auth_token
    @country = @client.voice.countries.get('US')
    puts @country.iso_country
    puts @country.price_unit

    # A list of price rates for inbound calls to each type of Twilio Number
    # available in this country
    @country.inbound_call_prices.each do |p|
        puts p.number_type
        puts p.base_price # List price per minute
        puts p.current_price # Discounted price per minute
    end

    # A list of price rates for outbound calls to number, organized
    # by prefix.
    @country.outbound_prefix_prices.each do |p|
        puts p.prefixes # List of one or more prefixes this price applies to
        puts p.base_price # Base price per minute
        puts p.current_price # Discounted price per minute

Voice Numbers
-------------

To retrieve pricing information for Twilio Voice calls to and from a specific
number:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::PricingClient.new account_sid, auth_token
    @number = @client.voice.phone_numbers.get('+15105551234')
    puts @number.iso_country
    puts @number.price_unit
    puts @number.outbound_call_price.base_price
    puts @number.inbound_call_price.number_type # inbound_call_price will be nil if the number is not Twilio-hosted


Phone Number Pricing
====================

To retrieve a list of countries where Twilio phone numbers are available:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::PricingClient.new account_sid, auth_token
    @countries = @client.phone_numbers.countries.list
    @countries.each do |c|
        puts c.country
    end


Note that the country objects in the returned list will not have pricing
information populated; you will need to retrieve the specific information for
each country you are interested in individually:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::PricingClient.new account_sid, auth_token
    @country = @client.phone_numbers.countries.get('US')
    puts @country.iso_country
    puts @country.price_unit

    @country.phone_number_prices.each do |p|
        puts p.number_type # 'local', 'mobile', 'national', or 'toll_free'
        puts p.base_price # Price per month before any discounts have been applied
        puts p.current_price # Price per month after any available discounts from the requesting account have applied


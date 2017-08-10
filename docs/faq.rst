==========================
Frequently Asked Questions
==========================

Hopefully you can find an answer here to one of your questions. If not, please
contact `help@twilio.com <mailto:help@twilio.com>`_.


Formatting phone numbers
------------------------

Twilio always returns phone numbers that are formatted in the `E.164 format
<http://en.wikipedia.org/wiki/E.164>`_, like this: ``+12125551234``. However
your users may enter them like this: ``(212) 555-1234``. This can lead to
problems when, for example, Twilio makes a POST request to your server with the
``From`` phone number as ``+12125551234``, but you stored the phone number in
your database as ``(212) 555-1234``, causing a database lookup to fail.

We suggest that you convert the number to E.164 format
before you store it in the database. The `phony
<https://github.com/floere/phony>`_ gem is excellent
for this purpose. Install it like this:

.. code-block:: bash

    $ gem install phony

Then you can convert user input to phone numbers like this:

.. code-block:: ruby

    require 'phony'

    def convert_to_e164(raw_phone)
        Phony.format(
            raw_phone,
            format: :international,
            spaces: ''
        ).gsub(/\s+/, "") # Phony won't remove all spaces
    end

    puts convert_to_e164('212 555 1234')   # prints +12125551234

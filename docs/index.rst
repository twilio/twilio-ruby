=============================
Twilio Ruby Helper Library
=============================

.. _installation:

Installation
================

Just install the gem!

.. code-block:: bash

    $ gem install twilio-ruby

Getting Started
================

The :doc:`/getting-started` will get you up and running in a few quick minutes.
This guide assumes you understand the core concepts of Twilio.
If you've never used Twilio before, don't fret! Just read
`about how Twilio works <http://www.twilio.com/api/>`_ and then jump in!


.. _user-guide:

User Guide
==================

Functionality is split over three different sub-packages within
**twilio-ruby**. Below are in-depth guides to specific portions of the
library.


REST API
----------

Query the Twilio REST API to create phone calls, send SMS/MMS messages and more!

.. toctree::
    :maxdepth: 1

    usage/basics
    usage/errors
    usage/messages
    usage/phone-calls
    usage/phone-numbers
    usage/accounts
    usage/conferences
    usage/applications
    usage/notifications
    usage/recordings
    usage/transcriptions
    usage/caller-ids
    usage/queues
    usage/sip
    usage/pricing


TaskRouter
---------

Query the Twilio TaskRouter API to set up workspaces and task routing, and
create capability tokens to authorize your client-side code to safely update
state.

.. toctree::
    :maxdepth: 1

    usage/taskrouter
    usage/taskrouter-tokens


Lookups
-------

Query the Lookups API to get information about phone numbers and their carriers.

.. toctree::
    :maxdepth: 1

    usage/lookups

TwiML
---------

Generates valid TwiML for controlling and manipulating phone calls.

.. toctree::
    :maxdepth: 2

    usage/twiml

Utilities
----------

Small functions useful for validating requests are coming from Twilio

.. toctree::
    :maxdepth: 1

    usage/validation
    usage/token-generation

Frequently Asked Questions
==========================

What to do if you get an ``ImportError``, and some advice about how to format
phone numbers.

.. toctree::
    :maxdepth: 2

    faq

Changelog
=========

See the :doc:`/changelog` for version history.

Support and Development
==========================
All development occurs over on
`Github <https://github.com/twilio/twilio-ruby>`_. To checkout the source,

.. code-block:: bash

    $ git clone git@github.com:twilio/twilio-ruby.git


Report bugs using the Github
`issue tracker <https://github.com/twilio/twilio-ruby/issues>`_.

If you have questions that aren't answered by this documentation,
ask the `#twilio IRC channel <irc://irc.freenode.net/#twilio>`_

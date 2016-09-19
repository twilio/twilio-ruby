twilio-ruby changelog
=====================

Version 4.13.0
--------------

Released September 19, 2016:

- Add VideoGrant.

Version 4.12.1
--------------

Released September 1, 2016:

- Add VoiceGrant.

Version 4.11.1
-------------

Released February 12, 2016:

- Add missing Keys mount to Account

Version 4.11.0
-------------

Released January 28, 2016:

- Add support for alternative auth (eg. Keys)

Version 4.10.0
-------------

Released January 28, 2016:

- Add support for filter_friendly_name in WorkflowConfig
- Load reservations by default in TaskRouter

Version 4.9.1
-------------

Release January 28, 2016

- Fix ip messaging first person grant

Version 4.9.0
-------------

Release December 17, 2015

- Release ip messaging

Version 4.8.0
-------------

Release December 8, 2015

- Make nbf optional

Version 4.7.0
-------------

Release December 3, 2015

- Add access tokens

Version 4.6.2
-------------

Release November 19, 2015

- Fix Pricing Messages

Version 4.6.1
-------------

Release November 10, 2015

- Fix TrunkingClient references

Version 4.6.0
-------------

Release October 28, 2015

- Add /Keys endpoint

Version 4.4.0
-------------

Release September 23, 2015

- Add fetching a list of worker reservations
- Add TaskRouter Workflow builder

Version 4.3.0
-------------

Release August 11, 2015

- Add support for new Taskrouter JWT Functionality, JWTs now grant access to
  - Workspace
  - Worker
  - TaskQueue

Version 4.2.1
-------------

Release June 19, 2015

- Allow passing URL parameters through when getting statistics for TaskRouter objects
- URI encode phone number lookups
- Adds documentation for lookups

Version 4.2.0
-------------

Release May 19, 2015

- Add support for the beta field for IncomingPhoneNumbers and AvailablePhoneNumbers

Version 4.1.0
-------------

Released May 7, 2015

- Add support for the new Monitor API

Version 4.0.1
-------------

Released May 6, 2015

- Add support for the new Pricing API

Version 4.0.0
-------------

Released April 16, 2015

- Remove support for total
- Use configuration object instead of defaults hash for REST clients
- Moves statistics from task router client to individual classes
  - Deprecates statistics methods on task router client

Version 3.16.1
--------------

Released March 31, 2015

- Fix bug in PhoneNumbers resource

Version 3.16.0
--------------

Released March 31, 2015

- Add support for new Twilio Lookups API
- Update LICENSE wording

Version 3.15.2
--------------

Released March 10, 2015

- Add missing documentation on TaskRouter client

Version 3.15.1
--------------

Released February 18, 2015

- For real this time, add TaskRouterClient object and resources for new TaskRouter API

Version 3.15.0
--------------

Released February 18, 2015

- Adds TaskRouterClient object and resources for new TaskRouter API

Version 3.14.5
--------------

Released February 9, 2015

- Relaxes JWT gem version requirement
- Adds Ruby 2.2.0 testing to TravisCI

Version 3.14.4
--------------

Released January 8, 2015

- Feature: dynamically choose the auth token to validate requests with when using the TwilioWebhookAuthentication middleware.
- Deprecation: The Twilio::REST::SMS::Message resource is deprecated.
- More fixing of docs

Version 3.14.3
--------------

Released January 8, 2015

- Fix nil error in RequestValidator middleware
- Fix up docs

Version 3.14.2
--------------

Released November 24, 2014

- Fixed incomplete token support

Version 3.14.1
--------------

Released November 21, 2014

- Add support for the new Tokens endpoint

Version 3.14.0
--------------

Released November 13, 2014

- Switch to a constant-time string comparison for TwiML request signature validation
- Add support for Call and Message deletion/redaction

Version 3.13.1
--------------

Released October 1, 2014

- Bump required version to 1.9.3

Version 3.13.0
--------------

Released September 23, 2014

- Deprecates 1.8.7 support
- Internal code style changes including:
    - change symbol hash syntax to Ruby 1.9 style
    - remove curly braces from hash arguments to methods
    - add spaces around curly braces in blocks
    - reduces all lines to less than 80 characters

Version 3.12.3
--------------

Released September 23, 2014

- Added block configure syntax

Version 3.12.2
--------------

Released August 29, 2014

- `client.account.{resource}` can now be accessed with `client.{resource}`
- Many doc updates

Version 3.12.1
--------------

Released August 26, 2014

- Add support for new call feedback endpoints

Version 3.12.0
--------------

Released August 18, 2014

- Add Rack middleware for Twilio request-signature validation
- Upgrade dependencies and clean up project files
- Documentation fixes
- Add `text` alias for `to_xml` method on TwiML generator objects

Version 3.11.6
--------------

Released July 25, 2014

- Add #to_xml to TwiML Responses.
- Updated test / development dependencies.
- Updated to RSpec 3 syntax.

Version 3.11.5
--------------

Released February 4, 2014

- Add bangs for twilify to indicate it's a dangerous operation.
- Remove reference to deprecated OpenSSL Digest parameter.
- Encode dates properly before passing them to the Twilio API.

Version 3.11.4
--------------

Released October 21, 2013

- Add support for listing IncomingPhoneNumbers by type.
- Add support for searching for mobile enabled numbers for
both IncomingPhoneNumbers and AvailablePhoneNumbers.

Version 3.11.3
--------------

Released October 15, 2013

- Restore support for versions of Ruby other than 2.0.0, which the
previous release removed.

Version 3.11.2

Released October 15, 2013

- Restore ability of `sms.messages` to make requests to /SMS/Messages.

Version 3.11.1
--------------

Released September 24, 2013

- Fix a bug causing request the new messages class to fail.

Version 3.11.0
-------------

Released September 18, 2013

- Add MMS support.
- Add SIP-In support.
- Add docs.

twilio-ruby changelog
=====================
[2017-07-06] Version 5.0.0.rc25
--------------------------------
**Messaging**
- Fix incorrectly typed capabilities property for PhoneNumbers.

**Notify**
- Add `ToBinding` optional parameter on Notifications resource creation. Accepted values are json strings.

**Preview**
- [omit] Enabled beta feature flag (api.vault.data-platform) for bulk_exports api

**Video**
- Filter recordings by date using the parameters `DateCreatedAfter` and `DateCreatedBefore`.
- Override the default time-to-live of a recording's media URL through the `Ttl` parameter (in seconds, default value is 3600).
- Add query parameters `SourceSid`, `Status`, `DateCreatedAfter` and `DateCreatedBefore` to the convenience method for retrieving Room recordings.

**Wireless**
- Added national and international data limits to the RatePlans resource.


[2017-06-22] Version 5.0.0.rc24
-------------------------------
- Namespaced Policy, Grants, and Scope to their respective Token.
- Added `announce_url` and `annouce_url_method` to Conference update.
- Added `store_media` to Fax.

[2017-06-19] Version 5.0.0.rc23
-------------------------------
- Fixed ClientCapability parameter encoded bug.
- Optional URL parameter for TwiML Play verb. 

[2017-06-15] Version 5.0.0.rc22
-------------------------------
- Refactor JWT token constructors 


[2017-05-24] Version 5.0.0.rc21
-------------------------------
- Add HostedNumbers preview support.
- Add Proxy preview support.
- Add BulkExports preview support.

[2017-05-22] Version 5.0.0.rc20
-------------------------------
- Add Wireless Domain
- Add Fax Domain
- Add Video Domain
- Updated Usage Trigger enums with missing categories.
- Add `area_code_geomatch`, `validtiy_period`, `fallback_to_long_code` to Messaging Service
- Converted `TwilioException` to `TwilioError`

[2017-04-27] Version 5.0.0.rc19
-------------------------------

- Add chat v2.
- Wireless rate plans updates.
- Message `ValidityPeriod` parameter.
- New Usage API categories.

Version 5.0.0.rc18
-------------------------------

Release April 17, 2017

- Update VideoGrant access token to accept `room` instead of `configuration_profile_sid`

Version 5.0.0.rc16
-------------------------------

Release September 1, 2016

- Add voice grant.

Version 5.0.0.rc8
-------------

Release July 8, 2016

- Add SMS and Facebook Messenger for Notify

Version 5.0.0.rc7
-------------

Release June 9, 2016

- Add messaging feedback support


Version 5.0.0.rc5
-------------

Release May 31, 2016

- Add preview.twilio.com/wireless support

Version 5.0.0.rc4
-------------

Release March 28, 2016

- Add notifications.twilio.com subdomain

Version 5.0.0
-------------

Release January 29, 2016

- First class paging support
- Streaming auto-paging functionality
- Separation between strict paging and streaming, with network-efficient defaults
- Fully configurable and swappable HTTP Client interfaces
- Normalization of mounts -> endpoints relations, with first-class unified support for subdomains and multi-version support
- Fixed URL pathing of subresources, preventing edge case errors with path building via mounting
- Proper serialization/deserialization of types (integers, dates, etc.)

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

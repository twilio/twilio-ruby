twilio-ruby changelog
=====================

[2019-08-05] Version 5.25.3
----------------------------
**Preview**
- Added support for the header `Twilio-Sandbox-Mode` to mock all Voice dependencies

**Twiml**
- Add support for `<Siprec>` noun
- Add support for `<Stream>` noun
- Create verbs `<Start>` and `<Stop>`


[2019-07-24] Version 5.25.2
----------------------------
**Insights**
- Added `properties` to summary.

**Preview**
- Added endpoint to brand a call without initiating it, so it can be initiated manually by the Customer

**Twiml**
- Update `<Conference>` recording events **(breaking change)**


[2019-07-10] Version 5.25.1
----------------------------
**Api**
- Make `friendly_name` optional for applications create
- Add new property `as_of` date to Usage Record API calls

**Wireless**
- Added Usage Records resource.


[2019-06-26] Version 5.25.0
----------------------------
**Autopilot**
- Adds two new properties in Assistant i.e needs_model_build and development_stage

**Preview**
- Changed phone numbers from _URL|Path_ to `X-XCNAM-Sensitive` headers **(breaking change)**

**Verify**
- Add `MessagingConfiguration` resource to verify service


[2019-06-12] Version 5.24.0
----------------------------
**Autopilot**
- Add Webhooks resource to Autopilot Assistant.

**Flex**
- Added missing 'custom' type to Flex Flow
- Adding `integrations` to Flex Configuration

**Insights**
- Added attributes to summary.

**Messaging**
- Message API Create updated with conditional params **(breaking change)**

**Proxy**
- Document that Proxy will return a maximum of 100 records for read/list endpoints **(breaking change)**
- Remove non-updatable property parameters for Session update (mode, participants) **(breaking change)**

**Sync**
- Added reachability debouncing configuration options.

**Verify**
- Add `RateLimits` and `Buckets` resources to Verify Services
- Add `RateLimits` optional parameter on `Verification` creation.

**Twiml**
- Fix `<Room>` participantIdentity casing


[2019-05-29] Version 5.23.1
----------------------------
**Verify**
- Add `approved` to status enum


[2019-05-15] Version 5.23.0
----------------------------
**Api**
- Make `method` optional for queue members update

**Chat**
- Removed `webhook.*.format` update parameters in Service resource from public library visibility in v1 **(breaking change)**

**Insights**
- Added client metrics as sdk_edge to summary.
- Added optional query param processing_state.

**Numbers**
- Add addtional metadata fields on a Document
- Add status callback fields and parameters

**Taskrouter**
- Added `channel_optimized_routing` attribute to task-channel endpoint

**Video**
- [Rooms] Add Video Subscription API

**Wireless**
- Added `imei` to Data Session resource.
- Remove `imeisv` from Data Session resource. **(breaking change)**


[2019-05-01] Version 5.22.3
----------------------------
**Serverless**
- Documentation

**Wireless**
- Added `imeisv` to Data Session resource.


[2019-04-24] Version 5.22.2
----------------------------
**Api**
- Add `verified` property to Addresses

**Numbers**
- Add API for Identites and documents

**Proxy**
- Add in use count on number instance


[2019-04-12] Version 5.22.1
----------------------------
**Flex**
- Adding PluginService to Flex Configuration

**Numbers**
- Add API for Proof of Addresses

**Proxy**
- Clarify documentation for Service and Session fetch

**Serverless**
- Serverless scaffolding


[2019-03-28] Version 5.22.0
----------------------------
**Api**
- Remove optional `if_machine` call create parameter from helper libraries **(breaking change)**
- Changed `call_sid` path parameter type on QueueMember fetch and update requests **(breaking change)**

**Voice**
- changed file names to dialing_permissions prefix **(breaking change)**

**Wireless**
- Added `ResetStatus` property to Sim resource to allow resetting connectivity via the API.


[2019-03-15] Version 5.21.2
----------------------------
**Library**
- PR #444: Add Help Center and Support Ticket links to the README. Thanks to @childish-sambino!

**Api**
- Add `machine_detection_speech_threshold`, `machine_detection_speech_end_threshold`, `machine_detection_silence_timeout` optional params to Call create request

**Flex**
- Adding Flex Channel Orchestration
- Adding Flex Flow


[2019-03-06] Version 5.21.1
----------------------------
**Twiml**
- Add `de1` to `<Conference>` regions


[2019-03-01] Version 5.21.0
----------------------------
**Api**
- Make conference participant preview parameters public

**Authy**
- Added support for FactorType and FactorStrength for Factors and Challenges

**Iam**
- First public release

**Verify**
- Add endpoint to update/cancel a Verification **(breaking change)**

**Video**
- [Composer] Make RoomSid mandatory **(breaking change)**
- [Composer] Add `enqueued` state to Composition

**Twiml**
- Update message body to not be required for TwiML `Dial` noun.


[2019-02-15] Version 5.20.1
----------------------------
**Library**
- PR #438: Add a Ruby inspect method to Context classes. Thanks to @childish-sambino!

**Api**
- Add `force_opt_in` optional param to Messages create request
- Add agent conference category to usage records

**Flex**
- First public release

**Taskrouter**
- Adding `reject_pending_reservations` to worker update endpoint
- Added `event_date_ms` and `worker_time_in_previous_activity_ms` to Events API response
- Add ability to filter events by TaskChannel

**Verify**
- Add `EnablePsd2` optional parameter for PSD2 on Service resource creation or update.
- Add `Amount`, `Payee` optional parameters for PSD2.


[2019-02-04] Version 5.20.0
----------------------------
**Library**
- PR #437: Switch body validator to use hex instead of base64. Thanks to @cjcodes!

**Video**
- [Recordings] Add media type filter to list operation
- [Composer] Filter Composition Hook resources by FriendlyName

**Twiml**
- Update `language` enum for `Gather` to fix language code for Filipino (Philippines) and include additional supported languages **(breaking change)**


[2019-01-11] Version 5.19.0
----------------------------
**Library**
- PR #436: Remove jruby-openssl requirement. Thanks to @philnash!

**Chat**
- Mark Member attributes as PII

**Insights**
- Initial revision.

**Proxy**
- Remove unsupported query parameters **(breaking change)**
- Remove invalid session statuses in doc

**Verify**
- Add `lookup` information in the response when creating a new verification (depends on the LookupEnabled flag being enabled at the service level)
- Add `VerificationSid` optional parameter on Verification check.


[2018-12-17] Version 5.18.0
----------------------------
**Authy**
- Reverted the change to `FactorType` and `FormType`, avoiding conflicts with Helper Libraries reserved words (`type`) **(breaking change)**

**Proxy**
- Remove incorrect parameter for Session List

**Studio**
- Support date created filtering on list of executions

**Taskrouter**
- Adding ability to Create, Modify and Delete Task Channels.

**Verify**
- Add `SkipSmsToLandlines`, `TtsName`, `DtmfInputRequired` optional parameters on Service resource creation or update.

**Wireless**
- Added delete action on Command resource.
- Added delete action on Sim resource.

**Twiml**
- Change `currency` from enum to string for `Pay` **(breaking change)**


[2018-11-30] Version 5.17.0
----------------------------
**Api**
- Add `interactive_data` optional param to Messages create request

**Authy**
- Required authentication for `/v1/Forms/{type}` endpoint **(breaking change)**
- Removed `Challenge.reason` to `Challenge.responded_reason`
- Removed `verification_sid` from Challenge responses
- Removed `config` param from the Factor creation
- Replaced all occurrences of `FactorType` and `FormType` in favor of a unified `Type` **(breaking change)**

**Chat**
- Add Member attributes

**Preview**
- Removed `Authy` version from `preview` subdomain in favor to `authy` subdomain. **(breaking change)**

**Verify**
- Add `CustomCode` optional parameter on Verication creation.


[2018-11-16] Version 5.16.0
----------------------------
**Messaging**
- Session API

**Twiml**
- Change `master-card` to `mastercard` as `cardType` for `Pay` and `Prompt`, remove attribute `credential_sid` from `Pay` **(breaking change)**


[2018-10-29] Version 5.15.2
----------------------------
**Api**
- Add new Balance resource:
    - url: '/v1/Accounts/{account sid}/Balance'
    - supported methods: GET
    - returns the balance of the account

**Proxy**
- Add chat_instance_sid to Service

**Verify**
- Add `Locale` optional parameter on Verification creation.


[2018-10-15] Version 5.15.1
----------------------------
**Api**
- Add <Pay> Verb Transactions category to usage records

**Twiml**
- Add support for `Pay` verb


[2018-10-15] Version 5.15.0
----------------------------
**Library**
- PR #428: Fix custom param tests. Thanks to @ryan-rowland!

**Api**
- Add `coaching` and `call_sid_to_coach` to participant properties, create and update requests.

**Authy**
- Set public library visibility, and added PII stanza
- Dropped support for `FactorType` param given new Factor prefixes **(breaking change)**
- Supported `DELETE` actions for Authy resources
- Move Authy Services resources to `authy` subdomain

**Autopilot**
- Introduce `autopilot` subdomain with all resources from `preview.understand`

**Preview**
- Renamed Understand intent to task **(breaking change)**
- Deprecated Authy endpoints from `preview` to `authy` subdomain

**Taskrouter**
- Allow TaskQueue ReservationActivitySid and AssignmentActivitySid to not be configured for MultiTask Workspaces

**Verify**
- Add `LookupEnabled` optional parameter on Service resource creation or update.
- Add `SendDigits` optional parameter on Verification creation.
- Add delete action on Service resourse.

**Twiml**
- Add custom parameters to TwiML `Client` noun and renamed the optional `name` field to `identity`. This is a breaking change in Ruby, and applications will need to transition from `dial.client ''` and `dial.client 'alice'` formats to `dial.client` and `dial.client(identity: alice)` formats. **(breaking change)**


[2018-10-04] Version 5.14.1
----------------------------
**Twiml**
- Add `debug` to `Gather`
- Add `participantIdentity` to `Room`


[2018-09-28] Version 5.14.0
----------------------------
**Api**
- Set `call_sid_to_coach` parameter in participant to be `preview`

**Preview**
- Renamed response headers for Challenge and Factors Signatures
- Supported `totp` in Authy preview endpoints
- Allowed `latest` in Authy Challenges endpoints

**Video**
- [Composer] Add Composition Hook resources

**Voice**
- changed path param name from parent_iso_code to iso_code for highrisk_special_prefixes api **(breaking change)**
- added geo permissions public api


[2018-09-20] Version 5.13.0
----------------------------
**Preview**
- Add `Form` resource to Authy preview given a `form_type`
- Add Authy initial api-definitions in the 4 main resources: Services, Entities, Factors, Challenges

**Pricing**
- add voice_numbers resource (v2)

**Verify**
- Move from preview to beta **(breaking change)**


[2018-08-31] Version 5.12.4
----------------------------
**Library**
- PR #427: VCORE-3651 Add support for *for* attribute in twiml element. Thanks to @nmahure!

**Api**
- Add `call_sid_to_coach` parameter to participant create request
- Add `voice_receive_mode` param to IncomingPhoneNumbers create

**Video**
- [Recordings] Expose `offset` property in resource


[2018-08-23] Version 5.12.3
----------------------------
**Chat**
- Add User Channel instance resource


[2018-08-17] Version 5.12.2
----------------------------
**Api**
- Add Proxy Active Sessions category to usage records

**Preview**
- Add `Actions` endpoints and remove `ResponseUrl` from assistants on the Understand api

**Pricing**
- add voice_country resource (v2)


[2018-08-09] Version 5.12.1
----------------------------
**Library**
- PR #426: Add a test showing how to emit "interpret-as". Thanks to @ekarson!

**Studio**
- Studio is now GA


[2018-08-03] Version 5.12.0
----------------------------
**Library**
- PR #420: Tag and push Docker latest image when deploying with TravisCI. Thanks to @jonatasbaldin!

**Chat**
- Make message From field updatable
- Add REST API webhooks

**Notify**
- Removing deprecated `segments`, `users`, `segment_memberships`, `user_bindings` classes from helper libraries. **(breaking change)**

**Preview**
- Add new Intent Statistics endpoint
- Remove `ttl` from Assistants

**Twiml**
- Add `Connect` and `Room` for Programmable Video Rooms


[2018-07-26] Version 5.11.2
----------------------------
**Library**
- PR #424: Fix Say example in README.md. Thanks to @HuipengRen!

**Api**
- Add support for sip domains to map credential lists for registrations

**Preview**
- Remove `ttl` from Assistants

**Proxy**
- Enable setting a proxy number as reserved

**Twiml**
- Add support for SSML lang tag on Say verb


[2018-07-17] Version 5.11.1
----------------------------
**Library**
- PR #422: Add attribute overrides from generated code. Thanks to @cjcodes!

**Video**
- Add `group-small` room type


[2018-07-16] Version 5.11.0
----------------------------
**Library**
- PR #421: Fix TwiML Say verb spec. Thanks to @HuipengRen!
- PR #419: Add a request body validator. Thanks to @cjcodes!
- PR #418: Remove support for ruby 2.0 and 2.1, adds 2.5. Thanks to @cjcodes!

**Twiml**
- Add support for SSML on Say verb, the message body is changed to be optional **(breaking change)**


[2018-07-11] Version 5.10.7
----------------------------
**Api**
- Add `cidr_prefix_length` param to SIP IpAddresses API

**Studio**
- Add new /Execution endpoints to begin Engagement -> Execution migration

**Video**
- [Rooms] Allow deletion of individual recordings from a room


[2018-07-05] Version 5.10.6
----------------------------
**Library**
- PR #413: Add Dockerfile and related changes to build the Docker image. Thanks to @jonatasbaldin!

**Api**
- Release `Call Recording Controls` feature support in helper libraries
- Add Voice Insights sub-category keys to usage records


[2018-06-21] Version 5.10.5
----------------------------
**Library**
- PR #414: Added test for mixed content. Thanks to @ekarson!

**Video**
- Allow user to set `ContentDisposition` when obtaining media URLs for Room Recordings and Compositions
- Add Composition Settings resource


[2018-06-19] Version 5.10.4
----------------------------
**Library**
- PR #412: Allow adding TwiML children with generic tag names. Thanks to @ekarson!
- PR #408: Add validate_ssl_certificate helper method to Client. Thanks to @ekarson!
- PR #410: Allow adding text nodes to TwiML responses. Thanks to @ekarson!

**Api**
- Add Fraud Lookups category to usage records

**Twiml**
- Add methods to helper libraries to inject arbitrary text under a TwiML node


[2018-06-04] Version 5.10.3
----------------------------
**Library**
- PR #409: Switch to single quotes for rubocop. Thanks to @cjcodes!
- PR #407: Allows developers to add comments to TwiML. Thanks to @philnash!
- PR #405: Update description. Thanks to @efossier!

**Chat**
- Add Binding and UserBinding documentation

**Lookups**
- Add back support for `fraud` lookup type


[2018-05-25] Version 5.10.2
----------------------------
**Studio**
- Add endpoint to delete engagements


[2018-05-18] Version 5.10.1
----------------------------
**Api**
- Add more programmable video categories to usage records
- Add 'include_subaccounts' parameter to all variation of usage_record fetch

**Trunking**
- Added cnam_lookup_enabled parameter to Trunk resource.
- Added case-insensitivity for recording parameter to Trunk resource.


[2018-05-11] Version 5.10.0
----------------------------
**Chat**
- Add Channel Webhooks resource

**Monitor**
- Update event filtering to support date/time **(breaking change)**

**Wireless**
- Updated `maturity` to `ga` for all wireless apis


[2018-04-27] Version 5.9.0
---------------------------
**Library**
- PR #403: Adds frozen_string_literal magic comment. Thanks to @philnash!

**Video**
- Redesign API by adding custom `VideoLayout` object. **(breaking change)**


[2018-04-20] Version 5.8.1
---------------------------
**Library**
- PR #397: Uses Twilio::REST::RestError when a page fails to load. Thanks to @philnash!

**Twiml**
- Gather input Enum: remove unnecessary "dtmf speech" value as you can now specify multiple enum values for this parameter and both "dtmf" and "speech" are already available.


[2018-04-13] Version 5.8.0
---------------------------
**Library**
- PR #389: Add incoming.allow to AccessToken VoiceGrant. Thanks to @ryan-rowland!
- PR #391: Improves error message for Twilio::REST::RestError. Thanks to @philnash!

**Lookups**
- Disable support for `fraud` lookups **(breaking change)**

**Preview**
- Support for Understand V2 APIs - renames various resources and adds new fields

**Studio**
- Change parameters type from string to object in engagement resource

**Video**
- [Recordings] Change `size` type to `long`. **(breaking change)**


[2018-03-22] Version 5.7.2
---------------------------
**Preview**
- Add `BuildDuration` and `ErrorCode` to Understand ModelBuild

**Studio**
- Add new /Context endpoint for step and engagement resources.


[2018-03-09] Version 5.7.1
---------------------------
**Api**
- Add `caller_id` param to Outbound Calls API
- Release `trim` recording Outbound Calls API functionality in helper libraries

**Video**
- Add `room_sid` to Composition resource.

**Twiml**
- Adds support for passing in multiple input type enums when setting `input` on `Gather`


[2018-03-02] Version 5.7.0
---------------------------
**TwiML**
- Allow newlines in TwiML content. Better XML configuration in general.

**Studio**
- Add new /Context endpoint for step and engagement resources. Removes the context property from existing step and engagement resources. *(breaking change)*


[2018-02-23] Version 5.6.4
---------------------------
**Library**
- PR #385 - Fix ClientCapability appParams

**Api**
- Add `trim` param to Outbound Calls API

**Lookups**
- Add support for `fraud` lookup type

**Numbers**
- Initial Release

**Video**
- [composer] Add `SEQUENCE` value to available layouts, and `trim` and `reuse` params.


[2018-02-09] Version 5.6.3
---------------------------
**Api**
- Add `AnnounceUrl` and `AnnounceMethod` params for conference announce

**Chat**
- Add support to looking up user channels by identity in v1


[2018-01-30] Version 5.6.2
---------------------------
**Api**
- Add `studio-engagements` usage key

**Preview**
- Remove Studio Engagement Deletion

**Studio**
- Initial Release

**Video**
- [omit] Beta: Allow updates to `SubscribedTracks`.
- Add `SubscribedTracks`.
- Add track name to Video Recording resource
- Add Composition and Composition Media resources


[2018-01-22] Version 5.6.1
---------------------------
**Api**
- Add `conference_sid` property on Recordings
- Add proxy and sms usage key

**Chat**
- Make user channels accessible by identity
- Add notifications logs flag parameter

**Fax**
- Added `ttl` parameter
  `ttl` is the number of minutes a fax is considered valid.

**Preview**
- Add `call_delay`, `extension`, `verification_code`, and `verification_call_sids`.
- Add `failure_reason` to HostedNumberOrders.
- Add DependentHostedNumberOrders endpoint for AuthorizationDocuments preview API.


[2017-12-15] Version 5.6.0
---------------------------
**Api**
- Add `voip`, `national`, `shared_cost`, and `machine_to_machine` sub-resources to `/2010-04-01/Accounts/{AccountSid}/AvailablePhoneNumbers/{IsoCountryCode}/`
- Add programmable video keys

**Preview**
- Add `verification_type` and `verification_document_sid` to HostedNumberOrders.

**Proxy**
- Fixed typo in session status enum value

**Twiml**
- Fix Dial record property incorrectly typed as accepting TrimEnum values when it actually has its own enum of values. *(breaking change)*
- Add `priority` and `timeout` properties to Task TwiML.
- Add support for `recording_status_callback_event` for Dial verb and for Conference


[2017-12-01] Version 5.5.1
---------------------------
**Api**
- Use the correct properties for Dependent Phone Numbers of an Address *(breaking change)*
- Update Call Recordings with the correct properties

**Preview**
- Add `status` and `email` query param filters for AuthorizationDocument list endpoint

**Proxy**
- Added DELETE support to Interaction
- Standardized enum values to dash-case
- Rename Service#friendly_name to Service#unique_name

**Video**
- Remove beta flag from `media_region` and `video_codecs`

**Wireless**
- Bug fix: Changed `operator_mcc` and `operator_mnc` in `DataSessions` subresource from `integer` to `string`


[2017-11-17] Version 5.5.0
---------------------------
**Sync**
- Add TTL support for Sync objects *(breaking change)*
  - The required `data` parameter on the following actions is now optional: "Update Document", "Update Map Item", "Update List Item"
  - New actions available for updating TTL of Sync objects: "Update List", "Update Map", "Update Stream"

**Video**
- [bi] Rename `RoomParticipant` to `Participant`
- Add Recording Settings resource
- Expose EncryptionKey and MediaExternalLocation properties in Recording resource


[2017-11-10] Version 5.4.5
---------------------------
**Accounts**
- Add AWS credential type

**Preview**
- Removed `iso_country` as required field for creating a HostedNumberOrder.

**Proxy**
- Added new fields to Service: geo_match_level, number_selection_behavior, intercept_callback_url, out_of_session_callback_url


[2017-11-03] Version 5.4.4
---------------------------
**Library**
- PR #365: Fixed proxy interpolation. Thanks @ankane.

**Api**
- Add programmable video keys

**Video**
- Add `Participants`


[2017-10-27] Version 5.4.3
---------------------------
**Chat**
- Add Binding resource
- Add UserBinding resource


[2017-10-20] Version 5.4.2
---------------------------
**Library**
- #360 Fix downcasing twiml parameters that are not snake_case

[2017-10-20] Version 5.4.1
---------------------------
**Library**
- #359 Correctly set headers on Twilio::Response

**Api**
- Add `address_sid` param to IncomingPhoneNumbers create and update
- Add 'fax_enabled' option for Phone Number Search


[2017-10-13] Version 5.4.0
---------------------------
**Api**
- Add `smart_encoded` param for Messages
- Add `identity_sid` param to IncomingPhoneNumbers create and update

**Preview**
- Make 'address_sid' and 'email' optional fields when creating a HostedNumberOrder
- Add AuthorizationDocuments preview API.

**Proxy**
- Initial Release

**Wireless**
- Added `ip_address` to sim resource


[2017-10-06] Version 5.3.1
---------------------------
**Preview**
- Add `acc_security` (authy-phone-verification) initial api-definitions

**Taskrouter**
- [bi] Less verbose naming of cumulative and real time statistics


[2017-09-29] Version 5.3.0
---------------------------
**Library**
- Remove left over files from legacy 4.x library

**Chat**
- Make member accessible through identity
- Make channel subresources accessible by channel unique name
- Set get list 'max_page_size' parameter to 100
- Add service instance webhook retry configuration
- Add media message capability
- Make `body` an optional parameter on Message creation. *(breaking change)*

**Notify**
- `data`, `apn`, `gcm`, `fcm`, `sms` parameters in `Notifications` create resource now accept objects (hashes) instead of strings. Passing manually stringified json will continue to work.

**Taskrouter**
- Add new query ability by TaskChannelSid or TaskChannelUniqueName
- Move Events, Worker, Workers endpoint over to CPR
- Add new RealTime and Cumulative Statistics endpoints

**Video**
- Create should allow an array of video_codecs.
- Add video_codecs as a property of room to make it externally visible.


[2017-09-15] Version 5.2.3
---------------------------
**Api**
- Add `sip_registration` property on SIP Domains
- Add new video and market usage category keys
- Add support for transferring IncomingPhoneNumbers between accounts.


[2017-09-08] Version 5.2.2
---------------------------
- Add configurable timeout to HttpClient

[2017-09-01] Version 5.2.1
---------------------------
**Sync**
- Add support for Streams

**Wireless**
- Added DataSessions sub-resource to Sims.


[2017-08-25] Version 5.2.0
---------------------------
**Library**
- Add `last_request`, `last_response` properties to http client for easier debugging.
- Add `Request` class to abstract http client implementations.
- Rename `TwilioResponse` to `Response` for consistency, deprecate `TwilioResponse` class.
- Support libxml 2 and 3. Issue #315. Thanks @malmckay.
- Add `inspect` methods to all classes. Thanks @malmckay.

**Api**
- Update `status` enum for Recordings to include 'failed'
- Add `error_code` property on Recordings

**Chat**
- Add mutable parameters for channel, members and messages

**Video**
- New `media_region` parameter when creating a room, which controls which region media will be served out of.


[2017-08-18] Version 5.1.2
---------------------------
**Api**
- Add VoiceReceiveMode {'voice', 'fax'} option to IncomingPhoneNumber UPDATE requests

**Chat**
- Add channel message media information
- Add service instance message media information

**Preview**
- Removed 'email' from bulk_exports configuration api [bi]. No migration plan needed because api has not been used yet.
- Add DeployedDevices.

**Sync**
- Add support for Service Instance unique names


[2017-08-10] Version 5.1.1
---------------------------
**Library**
- Don't override Faraday default param encoder. Thanks to @isaacseymour. PR #309
- Fix incorrectly aliased `to_xml` on TwiML classes. Thanks to @philnash. PR #318
- Only define `to_s` on BaseJWT instead of subclasses. Thanks to @philnash. PR #321
- Silence deprecation messages in testing. Thanks to @philnash. PR #323

**Api**
- Add New wireless usage keys added
- Add `auto_correct_address` param for Addresses create and update

**Video**
- Add `video_codec` enum and `video_codecs` parameter, which can be set to either `VP8` or `H264` during room creation.
- Restrict recordings page size to 100

**Chat**
- Add ChatGrant to available access tokens.
- Mark IpMessagingGrant as deprecated in favor of ChatGrant.


[2017-07-27] Version 5.1.0
---------------------------
This release adds Beta and Preview products to main artifact.

Previously, Beta and Preview products were only included in the alpha artifact.
They are now being included in the main artifact to ease product
discoverability and the collective operational overhead of maintaining multiple
artifacts per library.

**Api**
- Remove unused `encryption_type` property on Recordings *(breaking change)*
- Update `status` enum for Messages to include 'accepted'
- Update `AnnounceMethod` parameter naming for consistency

**Messaging**
- Fix incorrectly typed capabilities property for PhoneNumbers.

**Notify**
- Add `ToBinding` optional parameter on Notifications resource creation. Accepted values are json strings.

**Preview**
- Add `sms_application_sid` to HostedNumberOrders.
- Add `verification_attempts` to HostedNumberOrders.

**Taskrouter**
- Fully support conference functionality in reservations.


[2017-07-13] Version 5.0.0
--------------------------------
- Moving to General Availability

[2017-07-07] Version 5.0.0.rc26
--------------------------------
**Api**
- [omit] Rachet /Keys and /SigningKeys

**Preview**
- Add `status_callback_url` and `status_callback_method` to HostedNumberOrders.


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

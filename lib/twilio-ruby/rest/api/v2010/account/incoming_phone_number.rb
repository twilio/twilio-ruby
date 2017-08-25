##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class IncomingPhoneNumberList < ListResource
            ##
            # Initialize the IncomingPhoneNumberList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The unique id of the Account responsible for this
            #   phone number.
            # @return [IncomingPhoneNumberList] IncomingPhoneNumberList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/IncomingPhoneNumbers.json"

              # Components
              @local = nil
              @mobile = nil
              @toll_free = nil
            end

            ##
            # Lists IncomingPhoneNumberInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Boolean] beta Include phone numbers new to the Twilio platform
            # @param [String] friendly_name Only show the incoming phone number resources with
            #   friendly names that exactly match this name
            # @param [String] phone_number Only show the incoming phone number resources that
            #   match this pattern
            # @param [String] origin The origin
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, limit: nil, page_size: nil)
              self.stream(
                  beta: beta,
                  friendly_name: friendly_name,
                  phone_number: phone_number,
                  origin: origin,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams IncomingPhoneNumberInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Boolean] beta Include phone numbers new to the Twilio platform
            # @param [String] friendly_name Only show the incoming phone number resources with
            #   friendly names that exactly match this name
            # @param [String] phone_number Only show the incoming phone number resources that
            #   match this pattern
            # @param [String] origin The origin
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  beta: beta,
                  friendly_name: friendly_name,
                  phone_number: phone_number,
                  origin: origin,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields IncomingPhoneNumberInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of IncomingPhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [Boolean] beta Include phone numbers new to the Twilio platform
            # @param [String] friendly_name Only show the incoming phone number resources with
            #   friendly names that exactly match this name
            # @param [String] phone_number Only show the incoming phone number resources that
            #   match this pattern
            # @param [String] origin The origin
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of IncomingPhoneNumberInstance
            def page(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Beta' => beta,
                  'FriendlyName' => friendly_name,
                  'PhoneNumber' => phone_number,
                  'Origin' => origin,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              IncomingPhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of IncomingPhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of IncomingPhoneNumberInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              IncomingPhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of IncomingPhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] api_version Calls to this phone number will start a new TwiML
            #   session with this API version.
            # @param [String] friendly_name A human readable descriptive text for this
            #   resource, up to 64 characters long. By default, the `FriendlyName` is a nicely
            #   formatted version of the phone number.
            # @param [String] sms_application_sid The 34 character sid of the application
            #   Twilio should use to handle SMSs sent to this number. If a `SmsApplicationSid`
            #   is present, Twilio will ignore all of the SMS urls above and use those set on
            #   the application.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_url The URL Twilio will request when receiving an incoming
            #   SMS message to this number.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [String] voice_application_sid The 34 character sid of the application
            #   Twilio should use to handle phone calls to this number. If a
            #   `VoiceApplicationSid` is present, Twilio will ignore all of the voice urls above
            #   and use those set on the application. Setting a `VoiceApplicationSid` will
            #   automatically delete your `TrunkSid` and vice versa.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database ($0.01 per look up). Either `true` or `false`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_url The URL Twilio will request when this phone number
            #   receives a call. The VoiceURL will  no longer be used if a `VoiceApplicationSid`
            #   or a `TrunkSid` is set.
            # @param [incoming_phone_number.EmergencyStatus] emergency_status The
            #   emergency_status
            # @param [String] emergency_address_sid The emergency_address_sid
            # @param [String] trunk_sid The 34 character sid of the Trunk Twilio should use to
            #   handle phone calls to this number. If a `TrunkSid` is present, Twilio will
            #   ignore all of the voice urls  and voice applications above and use those set on
            #   the Trunk. Setting a `TrunkSid` will automatically delete your
            #   `VoiceApplicationSid` and vice versa.
            # @param [String] phone_number The phone number to purchase. e.g., +16175551212
            #   (E.164 format)
            # @param [String] area_code The desired area code for the new phone number. Any
            #   three digit US or Canada rea code is valid
            # @return [IncomingPhoneNumberInstance] Newly created IncomingPhoneNumberInstance
            def create(api_version: :unset, friendly_name: :unset, sms_application_sid: :unset, sms_fallback_method: :unset, sms_fallback_url: :unset, sms_method: :unset, sms_url: :unset, status_callback: :unset, status_callback_method: :unset, voice_application_sid: :unset, voice_caller_id_lookup: :unset, voice_fallback_method: :unset, voice_fallback_url: :unset, voice_method: :unset, voice_url: :unset, emergency_status: :unset, emergency_address_sid: :unset, trunk_sid: :unset, phone_number: :unset, area_code: :unset)
              data = Twilio::Values.of({
                  'PhoneNumber' => phone_number,
                  'AreaCode' => area_code,
                  'ApiVersion' => api_version,
                  'FriendlyName' => friendly_name,
                  'SmsApplicationSid' => sms_application_sid,
                  'SmsFallbackMethod' => sms_fallback_method,
                  'SmsFallbackUrl' => sms_fallback_url,
                  'SmsMethod' => sms_method,
                  'SmsUrl' => sms_url,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
                  'VoiceApplicationSid' => voice_application_sid,
                  'VoiceCallerIdLookup' => voice_caller_id_lookup,
                  'VoiceFallbackMethod' => voice_fallback_method,
                  'VoiceFallbackUrl' => voice_fallback_url,
                  'VoiceMethod' => voice_method,
                  'VoiceUrl' => voice_url,
                  'EmergencyStatus' => emergency_status,
                  'EmergencyAddressSid' => emergency_address_sid,
                  'TrunkSid' => trunk_sid,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              IncomingPhoneNumberInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Access the local
            # @return [LocalList]
            # @return [LocalContext]
            def local
              @local ||= LocalList.new(
                  @version,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Access the mobile
            # @return [MobileList]
            # @return [MobileContext]
            def mobile
              @mobile ||= MobileList.new(
                  @version,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Access the toll_free
            # @return [TollFreeList]
            # @return [TollFreeContext]
            def toll_free
              @toll_free ||= TollFreeList.new(
                  @version,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.IncomingPhoneNumberList>'
            end
          end

          class IncomingPhoneNumberPage < Page
            ##
            # Initialize the IncomingPhoneNumberPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [IncomingPhoneNumberPage] IncomingPhoneNumberPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of IncomingPhoneNumberInstance
            # @param [Hash] payload Payload response from the API
            # @return [IncomingPhoneNumberInstance] IncomingPhoneNumberInstance
            def get_instance(payload)
              IncomingPhoneNumberInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.IncomingPhoneNumberPage>'
            end
          end

          class IncomingPhoneNumberContext < InstanceContext
            ##
            # Initialize the IncomingPhoneNumberContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The incoming-phone-number Sid that uniquely identifies this
            #   resource
            # @return [IncomingPhoneNumberContext] IncomingPhoneNumberContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  sid: sid,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/IncomingPhoneNumbers/#{@solution[:sid]}.json"

              # Dependents
              @assigned_add_ons = nil
            end

            ##
            # Update the IncomingPhoneNumberInstance
            # @param [String] api_version Calls to this phone number will start a new TwiML
            #   session with this API version.
            # @param [String] friendly_name A human readable descriptive text for this
            #   resource, up to 64 characters long. By default, the `FriendlyName` is a nicely
            #   formatted version of the phone number.
            # @param [String] sms_application_sid The 34 character sid of the application
            #   Twilio should use to handle SMSs sent to this number. If a `SmsApplicationSid`
            #   is present, Twilio will ignore all of the SMS urls above and use those set on
            #   the application.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_url The URL Twilio will request when receiving an incoming
            #   SMS message to this number.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [String] voice_application_sid The 34 character sid of the application
            #   Twilio should use to handle phone calls to this number. If a
            #   `VoiceApplicationSid` is present, Twilio will ignore all of the voice urls above
            #   and use those set on the application. Setting a `VoiceApplicationSid` will
            #   automatically delete your `TrunkSid` and vice versa.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database ($0.01 per look up). Either `true` or `false`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_url The URL Twilio will request when this phone number
            #   receives a call. The VoiceURL will  no longer be used if a `VoiceApplicationSid`
            #   or a `TrunkSid` is set.
            # @param [incoming_phone_number.EmergencyStatus] emergency_status The
            #   emergency_status
            # @param [String] emergency_address_sid The emergency_address_sid
            # @param [String] trunk_sid The 34 character sid of the Trunk Twilio should use to
            #   handle phone calls to this number. If a `TrunkSid` is present, Twilio will
            #   ignore all of the voice urls  and voice applications above and use those set on
            #   the Trunk. Setting a `TrunkSid` will automatically delete your
            #   `VoiceApplicationSid` and vice versa.
            # @param [incoming_phone_number.VoiceReceiveMode] voice_receive_mode The
            #   voice_receive_mode
            # @return [IncomingPhoneNumberInstance] Updated IncomingPhoneNumberInstance
            def update(api_version: :unset, friendly_name: :unset, sms_application_sid: :unset, sms_fallback_method: :unset, sms_fallback_url: :unset, sms_method: :unset, sms_url: :unset, status_callback: :unset, status_callback_method: :unset, voice_application_sid: :unset, voice_caller_id_lookup: :unset, voice_fallback_method: :unset, voice_fallback_url: :unset, voice_method: :unset, voice_url: :unset, emergency_status: :unset, emergency_address_sid: :unset, trunk_sid: :unset, voice_receive_mode: :unset)
              data = Twilio::Values.of({
                  'ApiVersion' => api_version,
                  'FriendlyName' => friendly_name,
                  'SmsApplicationSid' => sms_application_sid,
                  'SmsFallbackMethod' => sms_fallback_method,
                  'SmsFallbackUrl' => sms_fallback_url,
                  'SmsMethod' => sms_method,
                  'SmsUrl' => sms_url,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
                  'VoiceApplicationSid' => voice_application_sid,
                  'VoiceCallerIdLookup' => voice_caller_id_lookup,
                  'VoiceFallbackMethod' => voice_fallback_method,
                  'VoiceFallbackUrl' => voice_fallback_url,
                  'VoiceMethod' => voice_method,
                  'VoiceUrl' => voice_url,
                  'EmergencyStatus' => emergency_status,
                  'EmergencyAddressSid' => emergency_address_sid,
                  'TrunkSid' => trunk_sid,
                  'VoiceReceiveMode' => voice_receive_mode,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              IncomingPhoneNumberInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Fetch a IncomingPhoneNumberInstance
            # @return [IncomingPhoneNumberInstance] Fetched IncomingPhoneNumberInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              IncomingPhoneNumberInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the IncomingPhoneNumberInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the assigned_add_ons
            # @return [AssignedAddOnList]
            # @return [AssignedAddOnContext] if sid was passed.
            def assigned_add_ons(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return AssignedAddOnContext.new(
                    @version,
                    @solution[:account_sid],
                    @solution[:sid],
                    sid,
                )
              end

              unless @assigned_add_ons
                @assigned_add_ons = AssignedAddOnList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    resource_sid: @solution[:sid],
                )
              end

              @assigned_add_ons
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.IncomingPhoneNumberContext #{context}>"
            end
          end

          class IncomingPhoneNumberInstance < InstanceResource
            ##
            # Initialize the IncomingPhoneNumberInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The unique id of the Account responsible for this
            #   phone number.
            # @param [String] sid The incoming-phone-number Sid that uniquely identifies this
            #   resource
            # @return [IncomingPhoneNumberInstance] IncomingPhoneNumberInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'address_requirements' => payload['address_requirements'],
                  'api_version' => payload['api_version'],
                  'beta' => payload['beta'],
                  'capabilities' => payload['capabilities'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'phone_number' => payload['phone_number'],
                  'origin' => payload['origin'],
                  'sid' => payload['sid'],
                  'sms_application_sid' => payload['sms_application_sid'],
                  'sms_fallback_method' => payload['sms_fallback_method'],
                  'sms_fallback_url' => payload['sms_fallback_url'],
                  'sms_method' => payload['sms_method'],
                  'sms_url' => payload['sms_url'],
                  'status_callback' => payload['status_callback'],
                  'status_callback_method' => payload['status_callback_method'],
                  'trunk_sid' => payload['trunk_sid'],
                  'uri' => payload['uri'],
                  'voice_application_sid' => payload['voice_application_sid'],
                  'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                  'voice_fallback_method' => payload['voice_fallback_method'],
                  'voice_fallback_url' => payload['voice_fallback_url'],
                  'voice_method' => payload['voice_method'],
                  'voice_url' => payload['voice_url'],
                  'emergency_status' => payload['emergency_status'],
                  'emergency_address_sid' => payload['emergency_address_sid'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [IncomingPhoneNumberContext] IncomingPhoneNumberContext for this IncomingPhoneNumberInstance
            def context
              unless @instance_context
                @instance_context = IncomingPhoneNumberContext.new(
                    @version,
                    @params['account_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            ##
            # @return [String] The unique sid that identifies this account
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [toll_free.AddressRequirement] Indicates if the customer requires an address
            def address_requirements
              @properties['address_requirements']
            end

            ##
            # @return [String] The Twilio REST API version to use
            def api_version
              @properties['api_version']
            end

            ##
            # @return [Boolean] Indicates if the phone number is a beta number
            def beta
              @properties['beta']
            end

            ##
            # @return [String] Indicate if a phone can receive calls or messages
            def capabilities
              @properties['capabilities']
            end

            ##
            # @return [Time] The date this resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] A human readable description of this resouce
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The incoming phone number
            def phone_number
              @properties['phone_number']
            end

            ##
            # @return [String] The origin
            def origin
              @properties['origin']
            end

            ##
            # @return [String] A string that uniquely identifies this resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Unique string that identifies the application
            def sms_application_sid
              @properties['sms_application_sid']
            end

            ##
            # @return [String] HTTP method used with sms fallback url
            def sms_fallback_method
              @properties['sms_fallback_method']
            end

            ##
            # @return [String] URL Twilio will request if an error occurs in executing TwiML
            def sms_fallback_url
              @properties['sms_fallback_url']
            end

            ##
            # @return [String] HTTP method to use with sms url
            def sms_method
              @properties['sms_method']
            end

            ##
            # @return [String] URL Twilio will request when receiving an SMS
            def sms_url
              @properties['sms_url']
            end

            ##
            # @return [String] URL Twilio will use to pass status parameters
            def status_callback
              @properties['status_callback']
            end

            ##
            # @return [String] HTTP method twilio will use with status callback
            def status_callback_method
              @properties['status_callback_method']
            end

            ##
            # @return [String] Unique string to identify the trunk
            def trunk_sid
              @properties['trunk_sid']
            end

            ##
            # @return [String] The URI for this resource
            def uri
              @properties['uri']
            end

            ##
            # @return [String] The unique sid of the application to handle this number
            def voice_application_sid
              @properties['voice_application_sid']
            end

            ##
            # @return [Boolean] Look up the caller's caller-ID
            def voice_caller_id_lookup
              @properties['voice_caller_id_lookup']
            end

            ##
            # @return [String] HTTP method used with fallback_url
            def voice_fallback_method
              @properties['voice_fallback_method']
            end

            ##
            # @return [String] URL Twilio will request when an error occurs in TwiML
            def voice_fallback_url
              @properties['voice_fallback_url']
            end

            ##
            # @return [String] HTTP method used with the voice url
            def voice_method
              @properties['voice_method']
            end

            ##
            # @return [String] URL Twilio will request when receiving a call
            def voice_url
              @properties['voice_url']
            end

            ##
            # @return [incoming_phone_number.EmergencyStatus] The emergency_status
            def emergency_status
              @properties['emergency_status']
            end

            ##
            # @return [String] The emergency_address_sid
            def emergency_address_sid
              @properties['emergency_address_sid']
            end

            ##
            # Update the IncomingPhoneNumberInstance
            # @param [String] api_version Calls to this phone number will start a new TwiML
            #   session with this API version.
            # @param [String] friendly_name A human readable descriptive text for this
            #   resource, up to 64 characters long. By default, the `FriendlyName` is a nicely
            #   formatted version of the phone number.
            # @param [String] sms_application_sid The 34 character sid of the application
            #   Twilio should use to handle SMSs sent to this number. If a `SmsApplicationSid`
            #   is present, Twilio will ignore all of the SMS urls above and use those set on
            #   the application.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_url The URL Twilio will request when receiving an incoming
            #   SMS message to this number.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [String] voice_application_sid The 34 character sid of the application
            #   Twilio should use to handle phone calls to this number. If a
            #   `VoiceApplicationSid` is present, Twilio will ignore all of the voice urls above
            #   and use those set on the application. Setting a `VoiceApplicationSid` will
            #   automatically delete your `TrunkSid` and vice versa.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database ($0.01 per look up). Either `true` or `false`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_url The URL Twilio will request when this phone number
            #   receives a call. The VoiceURL will  no longer be used if a `VoiceApplicationSid`
            #   or a `TrunkSid` is set.
            # @param [incoming_phone_number.EmergencyStatus] emergency_status The
            #   emergency_status
            # @param [String] emergency_address_sid The emergency_address_sid
            # @param [String] trunk_sid The 34 character sid of the Trunk Twilio should use to
            #   handle phone calls to this number. If a `TrunkSid` is present, Twilio will
            #   ignore all of the voice urls  and voice applications above and use those set on
            #   the Trunk. Setting a `TrunkSid` will automatically delete your
            #   `VoiceApplicationSid` and vice versa.
            # @param [incoming_phone_number.VoiceReceiveMode] voice_receive_mode The
            #   voice_receive_mode
            # @return [IncomingPhoneNumberInstance] Updated IncomingPhoneNumberInstance
            def update(api_version: :unset, friendly_name: :unset, sms_application_sid: :unset, sms_fallback_method: :unset, sms_fallback_url: :unset, sms_method: :unset, sms_url: :unset, status_callback: :unset, status_callback_method: :unset, voice_application_sid: :unset, voice_caller_id_lookup: :unset, voice_fallback_method: :unset, voice_fallback_url: :unset, voice_method: :unset, voice_url: :unset, emergency_status: :unset, emergency_address_sid: :unset, trunk_sid: :unset, voice_receive_mode: :unset)
              context.update(
                  api_version: api_version,
                  friendly_name: friendly_name,
                  sms_application_sid: sms_application_sid,
                  sms_fallback_method: sms_fallback_method,
                  sms_fallback_url: sms_fallback_url,
                  sms_method: sms_method,
                  sms_url: sms_url,
                  status_callback: status_callback,
                  status_callback_method: status_callback_method,
                  voice_application_sid: voice_application_sid,
                  voice_caller_id_lookup: voice_caller_id_lookup,
                  voice_fallback_method: voice_fallback_method,
                  voice_fallback_url: voice_fallback_url,
                  voice_method: voice_method,
                  voice_url: voice_url,
                  emergency_status: emergency_status,
                  emergency_address_sid: emergency_address_sid,
                  trunk_sid: trunk_sid,
                  voice_receive_mode: voice_receive_mode,
              )
            end

            ##
            # Fetch a IncomingPhoneNumberInstance
            # @return [IncomingPhoneNumberInstance] Fetched IncomingPhoneNumberInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the IncomingPhoneNumberInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the assigned_add_ons
            # @return [assigned_add_ons] assigned_add_ons
            def assigned_add_ons
              context.assigned_add_ons
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.IncomingPhoneNumberInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.IncomingPhoneNumberInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
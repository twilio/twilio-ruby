##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Preview
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Preview < PreviewBase
            class HostedNumbers < Version
                class HostedNumberOrderList < ListResource
                
                    ##
                    # Initialize the HostedNumberOrderList
                    # @param [Version] version Version that contains the resource
                    # @return [HostedNumberOrderList] HostedNumberOrderList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/HostedNumberOrders"
                        
                    end
                    ##
                    # Create the HostedNumberOrderInstance
                    # @param [String] phone_number The number to host in [+E.164](https://en.wikipedia.org/wiki/E.164) format
                    # @param [Boolean] sms_capability Used to specify that the SMS capability will be hosted on Twilio's platform.
                    # @param [String] account_sid This defaults to the AccountSid of the authorization the user is using. This can be provided to specify a subaccount to add the HostedNumberOrder to.
                    # @param [String] friendly_name A 64 character string that is a human readable text that describes this resource.
                    # @param [String] unique_name Optional. Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [Array[String]] cc_emails Optional. A list of emails that the LOA document for this HostedNumberOrder will be carbon copied to.
                    # @param [String] sms_url The URL that Twilio should request when somebody sends an SMS to the phone number. This will be copied onto the IncomingPhoneNumber resource.
                    # @param [String] sms_method The HTTP method that should be used to request the SmsUrl. Must be either `GET` or `POST`.  This will be copied onto the IncomingPhoneNumber resource.
                    # @param [String] sms_fallback_url A URL that Twilio will request if an error occurs requesting or executing the TwiML defined by SmsUrl. This will be copied onto the IncomingPhoneNumber resource.
                    # @param [String] sms_fallback_method The HTTP method that should be used to request the SmsFallbackUrl. Must be either `GET` or `POST`. This will be copied onto the IncomingPhoneNumber resource.
                    # @param [String] status_callback_url Optional. The Status Callback URL attached to the IncomingPhoneNumber resource.
                    # @param [String] status_callback_method Optional. The Status Callback Method attached to the IncomingPhoneNumber resource.
                    # @param [String] sms_application_sid Optional. The 34 character sid of the application Twilio should use to handle SMS messages sent to this number. If a `SmsApplicationSid` is present, Twilio will ignore all of the SMS urls above and use those set on the application.
                    # @param [String] address_sid Optional. A 34 character string that uniquely identifies the Address resource that represents the address of the owner of this phone number.
                    # @param [String] email Optional. Email of the owner of this phone number that is being hosted.
                    # @param [VerificationType] verification_type 
                    # @param [String] verification_document_sid Optional. The unique sid identifier of the Identity Document that represents the document for verifying ownership of the number to be hosted. Required when VerificationType is phone-bill.
                    # @return [HostedNumberOrderInstance] Created HostedNumberOrderInstance
                    def create(
                        phone_number: nil, 
                        sms_capability: nil, 
                        account_sid: :unset, 
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        cc_emails: :unset, 
                        sms_url: :unset, 
                        sms_method: :unset, 
                        sms_fallback_url: :unset, 
                        sms_fallback_method: :unset, 
                        status_callback_url: :unset, 
                        status_callback_method: :unset, 
                        sms_application_sid: :unset, 
                        address_sid: :unset, 
                        email: :unset, 
                        verification_type: :unset, 
                        verification_document_sid: :unset
                    )

                        data = Twilio::Values.of({
                            'PhoneNumber' => phone_number,
                            'SmsCapability' => sms_capability,
                            'AccountSid' => account_sid,
                            'FriendlyName' => friendly_name,
                            'UniqueName' => unique_name,
                            'CcEmails' => Twilio.serialize_list(cc_emails) { |e| e },
                            'SmsUrl' => sms_url,
                            'SmsMethod' => sms_method,
                            'SmsFallbackUrl' => sms_fallback_url,
                            'SmsFallbackMethod' => sms_fallback_method,
                            'StatusCallbackUrl' => status_callback_url,
                            'StatusCallbackMethod' => status_callback_method,
                            'SmsApplicationSid' => sms_application_sid,
                            'AddressSid' => address_sid,
                            'Email' => email,
                            'VerificationType' => verification_type,
                            'VerificationDocumentSid' => verification_document_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        HostedNumberOrderInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists HostedNumberOrderInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Status] status The Status of this HostedNumberOrder. One of `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, or `action-required`.
                    # @param [String] phone_number An E164 formatted phone number hosted by this HostedNumberOrder.
                    # @param [String] incoming_phone_number_sid A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, limit: nil, page_size: nil)
                        self.stream(
                            status: status,
                            phone_number: phone_number,
                            incoming_phone_number_sid: incoming_phone_number_sid,
                            friendly_name: friendly_name,
                            unique_name: unique_name,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Status] status The Status of this HostedNumberOrder. One of `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, or `action-required`.
                    # @param [String] phone_number An E164 formatted phone number hosted by this HostedNumberOrder.
                    # @param [String] incoming_phone_number_sid A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            status: status,
                            phone_number: phone_number,
                            incoming_phone_number_sid: incoming_phone_number_sid,
                            friendly_name: friendly_name,
                            unique_name: unique_name,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields HostedNumberOrderInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of HostedNumberOrderInstance records from the API.
                    # Request is executed immediately.
                    # @param [Status] status The Status of this HostedNumberOrder. One of `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, or `action-required`.
                    # @param [String] phone_number An E164 formatted phone number hosted by this HostedNumberOrder.
                    # @param [String] incoming_phone_number_sid A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of HostedNumberOrderInstance
                    def page(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Status' => status,
                            'PhoneNumber' => phone_number,
                            'IncomingPhoneNumberSid' => incoming_phone_number_sid,
                            'FriendlyName' => friendly_name,
                            'UniqueName' => unique_name,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        HostedNumberOrderPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of HostedNumberOrderInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of HostedNumberOrderInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    HostedNumberOrderPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Preview.HostedNumbers.HostedNumberOrderList>'
                    end
                end


                class HostedNumberOrderContext < InstanceContext
                    ##
                    # Initialize the HostedNumberOrderContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid A 34 character string that uniquely identifies this HostedNumberOrder.
                    # @return [HostedNumberOrderContext] HostedNumberOrderContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/HostedNumberOrders/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the HostedNumberOrderInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the HostedNumberOrderInstance
                    # @return [HostedNumberOrderInstance] Fetched HostedNumberOrderInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        HostedNumberOrderInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the HostedNumberOrderInstance
                    # @param [String] friendly_name A 64 character string that is a human readable text that describes this resource.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [String] email Email of the owner of this phone number that is being hosted.
                    # @param [Array[String]] cc_emails Optional. A list of emails that LOA document for this HostedNumberOrder will be carbon copied to.
                    # @param [Status] status 
                    # @param [String] verification_code A verification code that is given to the user via a phone call to the phone number that is being hosted.
                    # @param [VerificationType] verification_type 
                    # @param [String] verification_document_sid Optional. The unique sid identifier of the Identity Document that represents the document for verifying ownership of the number to be hosted. Required when VerificationType is phone-bill.
                    # @param [String] extension Digits to dial after connecting the verification call.
                    # @param [String] call_delay The number of seconds, between 0 and 60, to delay before initiating the verification call. Defaults to 0.
                    # @return [HostedNumberOrderInstance] Updated HostedNumberOrderInstance
                    def update(
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        email: :unset, 
                        cc_emails: :unset, 
                        status: :unset, 
                        verification_code: :unset, 
                        verification_type: :unset, 
                        verification_document_sid: :unset, 
                        extension: :unset, 
                        call_delay: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'UniqueName' => unique_name,
                            'Email' => email,
                            'CcEmails' => Twilio.serialize_list(cc_emails) { |e| e },
                            'Status' => status,
                            'VerificationCode' => verification_code,
                            'VerificationType' => verification_type,
                            'VerificationDocumentSid' => verification_document_sid,
                            'Extension' => extension,
                            'CallDelay' => call_delay,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        HostedNumberOrderInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.HostedNumbers.HostedNumberOrderContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.HostedNumbers.HostedNumberOrderContext #{context}>"
                    end
                end

                class HostedNumberOrderPage < Page
                    ##
                    # Initialize the HostedNumberOrderPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [HostedNumberOrderPage] HostedNumberOrderPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of HostedNumberOrderInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [HostedNumberOrderInstance] HostedNumberOrderInstance
                    def get_instance(payload)
                        HostedNumberOrderInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Preview.HostedNumbers.HostedNumberOrderPage>'
                    end
                end
                class HostedNumberOrderInstance < InstanceResource
                    ##
                    # Initialize the HostedNumberOrderInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this HostedNumberOrder
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [HostedNumberOrderInstance] HostedNumberOrderInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'incoming_phone_number_sid' => payload['incoming_phone_number_sid'],
                            'address_sid' => payload['address_sid'],
                            'signing_document_sid' => payload['signing_document_sid'],
                            'phone_number' => payload['phone_number'],
                            'capabilities' => payload['capabilities'],
                            'friendly_name' => payload['friendly_name'],
                            'unique_name' => payload['unique_name'],
                            'status' => payload['status'],
                            'failure_reason' => payload['failure_reason'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'verification_attempts' => payload['verification_attempts'] == nil ? payload['verification_attempts'] : payload['verification_attempts'].to_i,
                            'email' => payload['email'],
                            'cc_emails' => payload['cc_emails'],
                            'url' => payload['url'],
                            'verification_type' => payload['verification_type'],
                            'verification_document_sid' => payload['verification_document_sid'],
                            'extension' => payload['extension'],
                            'call_delay' => payload['call_delay'] == nil ? payload['call_delay'] : payload['call_delay'].to_i,
                            'verification_code' => payload['verification_code'],
                            'verification_call_sids' => payload['verification_call_sids'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [HostedNumberOrderContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = HostedNumberOrderContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this HostedNumberOrder.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the [IncomingPhoneNumber](https://www.twilio.com/docs/phone-numbers/api/incomingphonenumber-resource) resource that represents the phone number being hosted.
                    def incoming_phone_number_sid
                        @properties['incoming_phone_number_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the Address resource that represents the address of the owner of this phone number.
                    def address_sid
                        @properties['address_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the [Authorization Document](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource) the user needs to sign.
                    def signing_document_sid
                        @properties['signing_document_sid']
                    end
                    
                    ##
                    # @return [String] Phone number to be hosted. This must be in [E.164](https://en.wikipedia.org/wiki/E.164) format, e.g., +16175551212
                    def phone_number
                        @properties['phone_number']
                    end
                    
                    ##
                    # @return [PreviewHostedNumbersHostedNumberOrderCapabilities] 
                    def capabilities
                        @properties['capabilities']
                    end
                    
                    ##
                    # @return [String] A 64 character string that is a human-readable text that describes this resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] A message that explains why a hosted_number_order went to status \"action-required\"
                    def failure_reason
                        @properties['failure_reason']
                    end
                    
                    ##
                    # @return [Time] The date this resource was created, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this resource was updated, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The number of attempts made to verify ownership of the phone number that is being hosted.
                    def verification_attempts
                        @properties['verification_attempts']
                    end
                    
                    ##
                    # @return [String] Email of the owner of this phone number that is being hosted.
                    def email
                        @properties['email']
                    end
                    
                    ##
                    # @return [Array<String>] A list of emails that LOA document for this HostedNumberOrder will be carbon copied to.
                    def cc_emails
                        @properties['cc_emails']
                    end
                    
                    ##
                    # @return [String] The URL of this HostedNumberOrder.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [VerificationType] 
                    def verification_type
                        @properties['verification_type']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the Identity Document resource that represents the document for verifying ownership of the number to be hosted.
                    def verification_document_sid
                        @properties['verification_document_sid']
                    end
                    
                    ##
                    # @return [String] A numerical extension to be used when making the ownership verification call.
                    def extension
                        @properties['extension']
                    end
                    
                    ##
                    # @return [String] A value between 0-30 specifying the number of seconds to delay initiating the ownership verification call.
                    def call_delay
                        @properties['call_delay']
                    end
                    
                    ##
                    # @return [String] A verification code provided in the response for a user to enter when they pick up the phone call.
                    def verification_code
                        @properties['verification_code']
                    end
                    
                    ##
                    # @return [Array<String>] A list of 34 character strings that are unique identifiers for the calls placed as part of ownership verification.
                    def verification_call_sids
                        @properties['verification_call_sids']
                    end
                    
                    ##
                    # Delete the HostedNumberOrderInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the HostedNumberOrderInstance
                    # @return [HostedNumberOrderInstance] Fetched HostedNumberOrderInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the HostedNumberOrderInstance
                    # @param [String] friendly_name A 64 character string that is a human readable text that describes this resource.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [String] email Email of the owner of this phone number that is being hosted.
                    # @param [Array[String]] cc_emails Optional. A list of emails that LOA document for this HostedNumberOrder will be carbon copied to.
                    # @param [Status] status 
                    # @param [String] verification_code A verification code that is given to the user via a phone call to the phone number that is being hosted.
                    # @param [VerificationType] verification_type 
                    # @param [String] verification_document_sid Optional. The unique sid identifier of the Identity Document that represents the document for verifying ownership of the number to be hosted. Required when VerificationType is phone-bill.
                    # @param [String] extension Digits to dial after connecting the verification call.
                    # @param [String] call_delay The number of seconds, between 0 and 60, to delay before initiating the verification call. Defaults to 0.
                    # @return [HostedNumberOrderInstance] Updated HostedNumberOrderInstance
                    def update(
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        email: :unset, 
                        cc_emails: :unset, 
                        status: :unset, 
                        verification_code: :unset, 
                        verification_type: :unset, 
                        verification_document_sid: :unset, 
                        extension: :unset, 
                        call_delay: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            unique_name: unique_name, 
                            email: email, 
                            cc_emails: cc_emails, 
                            status: status, 
                            verification_code: verification_code, 
                            verification_type: verification_type, 
                            verification_document_sid: verification_document_sid, 
                            extension: extension, 
                            call_delay: call_delay, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.HostedNumbers.HostedNumberOrderInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.HostedNumbers.HostedNumberOrderInstance #{values}>"
                    end
                end

            end
        end
    end
end

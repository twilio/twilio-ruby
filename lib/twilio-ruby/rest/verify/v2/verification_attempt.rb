##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Verify
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Verify < VerifyBase
            class V2 < Version
                class VerificationAttemptList < ListResource
                
                    ##
                    # Initialize the VerificationAttemptList
                    # @param [Version] version Version that contains the resource
                    # @return [VerificationAttemptList] VerificationAttemptList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Attempts"
                        
                    end
                
                    ##
                    # Lists VerificationAttemptInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Time] date_created_after Datetime filter used to consider only Verification Attempts created after this datetime on the summary aggregation. Given as GMT in ISO 8601 formatted datetime string: yyyy-MM-dd'T'HH:mm:ss'Z.
                    # @param [Time] date_created_before Datetime filter used to consider only Verification Attempts created before this datetime on the summary aggregation. Given as GMT in ISO 8601 formatted datetime string: yyyy-MM-dd'T'HH:mm:ss'Z.
                    # @param [String] channel_data_to Destination of a verification. It is phone number in E.164 format.
                    # @param [String] country Filter used to query Verification Attempts sent to the specified destination country.
                    # @param [Channels] channel Filter used to query Verification Attempts by communication channel.
                    # @param [String] verify_service_sid Filter used to query Verification Attempts by verify service. Only attempts of the provided SID will be returned.
                    # @param [String] verification_sid Filter used to return all the Verification Attempts of a single verification. Only attempts of the provided verification SID will be returned.
                    # @param [ConversionStatus] status Filter used to query Verification Attempts by conversion status. Valid values are `UNCONVERTED`, for attempts that were not converted, and `CONVERTED`, for attempts that were confirmed.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(date_created_after: :unset, date_created_before: :unset, channel_data_to: :unset, country: :unset, channel: :unset, verify_service_sid: :unset, verification_sid: :unset, status: :unset, limit: nil, page_size: nil)
                        self.stream(
                            date_created_after: date_created_after,
                            date_created_before: date_created_before,
                            channel_data_to: channel_data_to,
                            country: country,
                            channel: channel,
                            verify_service_sid: verify_service_sid,
                            verification_sid: verification_sid,
                            status: status,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Time] date_created_after Datetime filter used to consider only Verification Attempts created after this datetime on the summary aggregation. Given as GMT in ISO 8601 formatted datetime string: yyyy-MM-dd'T'HH:mm:ss'Z.
                    # @param [Time] date_created_before Datetime filter used to consider only Verification Attempts created before this datetime on the summary aggregation. Given as GMT in ISO 8601 formatted datetime string: yyyy-MM-dd'T'HH:mm:ss'Z.
                    # @param [String] channel_data_to Destination of a verification. It is phone number in E.164 format.
                    # @param [String] country Filter used to query Verification Attempts sent to the specified destination country.
                    # @param [Channels] channel Filter used to query Verification Attempts by communication channel.
                    # @param [String] verify_service_sid Filter used to query Verification Attempts by verify service. Only attempts of the provided SID will be returned.
                    # @param [String] verification_sid Filter used to return all the Verification Attempts of a single verification. Only attempts of the provided verification SID will be returned.
                    # @param [ConversionStatus] status Filter used to query Verification Attempts by conversion status. Valid values are `UNCONVERTED`, for attempts that were not converted, and `CONVERTED`, for attempts that were confirmed.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(date_created_after: :unset, date_created_before: :unset, channel_data_to: :unset, country: :unset, channel: :unset, verify_service_sid: :unset, verification_sid: :unset, status: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            date_created_after: date_created_after,
                            date_created_before: date_created_before,
                            channel_data_to: channel_data_to,
                            country: country,
                            channel: channel,
                            verify_service_sid: verify_service_sid,
                            verification_sid: verification_sid,
                            status: status,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields VerificationAttemptInstance records from the API.
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
                    # Retrieve a single page of VerificationAttemptInstance records from the API.
                    # Request is executed immediately.
                    # @param [Time] date_created_after Datetime filter used to consider only Verification Attempts created after this datetime on the summary aggregation. Given as GMT in ISO 8601 formatted datetime string: yyyy-MM-dd'T'HH:mm:ss'Z.
                    # @param [Time] date_created_before Datetime filter used to consider only Verification Attempts created before this datetime on the summary aggregation. Given as GMT in ISO 8601 formatted datetime string: yyyy-MM-dd'T'HH:mm:ss'Z.
                    # @param [String] channel_data_to Destination of a verification. It is phone number in E.164 format.
                    # @param [String] country Filter used to query Verification Attempts sent to the specified destination country.
                    # @param [Channels] channel Filter used to query Verification Attempts by communication channel.
                    # @param [String] verify_service_sid Filter used to query Verification Attempts by verify service. Only attempts of the provided SID will be returned.
                    # @param [String] verification_sid Filter used to return all the Verification Attempts of a single verification. Only attempts of the provided verification SID will be returned.
                    # @param [ConversionStatus] status Filter used to query Verification Attempts by conversion status. Valid values are `UNCONVERTED`, for attempts that were not converted, and `CONVERTED`, for attempts that were confirmed.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of VerificationAttemptInstance
                    def page(date_created_after: :unset, date_created_before: :unset, channel_data_to: :unset, country: :unset, channel: :unset, verify_service_sid: :unset, verification_sid: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'DateCreatedAfter' =>  Twilio.serialize_iso8601_datetime(date_created_after),
                            'DateCreatedBefore' =>  Twilio.serialize_iso8601_datetime(date_created_before),
                            'ChannelData.To' => channel_data_to,
                            'Country' => country,
                            'Channel' => channel,
                            'VerifyServiceSid' => verify_service_sid,
                            'VerificationSid' => verification_sid,
                            'Status' => status,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        VerificationAttemptPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of VerificationAttemptInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of VerificationAttemptInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    VerificationAttemptPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.VerificationAttemptList>'
                    end
                end


                class VerificationAttemptContext < InstanceContext
                    ##
                    # Initialize the VerificationAttemptContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The unique SID identifier of a Verification Attempt
                    # @return [VerificationAttemptContext] VerificationAttemptContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Attempts/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the VerificationAttemptInstance
                    # @return [VerificationAttemptInstance] Fetched VerificationAttemptInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        VerificationAttemptInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.VerificationAttemptContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.VerificationAttemptContext #{context}>"
                    end
                end

                class VerificationAttemptPage < Page
                    ##
                    # Initialize the VerificationAttemptPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [VerificationAttemptPage] VerificationAttemptPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of VerificationAttemptInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [VerificationAttemptInstance] VerificationAttemptInstance
                    def get_instance(payload)
                        VerificationAttemptInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.VerificationAttemptPage>'
                    end
                end
                class VerificationAttemptInstance < InstanceResource
                    ##
                    # Initialize the VerificationAttemptInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this VerificationAttempt
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [VerificationAttemptInstance] VerificationAttemptInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'verification_sid' => payload['verification_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'conversion_status' => payload['conversion_status'],
                            'channel' => payload['channel'],
                            'price' => payload['price'],
                            'channel_data' => payload['channel_data'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [VerificationAttemptContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = VerificationAttemptContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID that uniquely identifies the verification attempt resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Verification resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/verify/api/service) used to generate the attempt.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Verification](https://www.twilio.com/docs/verify/api/verification) that generated the attempt.
                    def verification_sid
                        @properties['verification_sid']
                    end
                    
                    ##
                    # @return [Time] The date that this Attempt was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this Attempt was updated, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [ConversionStatus] 
                    def conversion_status
                        @properties['conversion_status']
                    end
                    
                    ##
                    # @return [Channels] 
                    def channel
                        @properties['channel']
                    end
                    
                    ##
                    # @return [Hash] An object containing the charge for this verification attempt related to the channel costs and the currency used. The costs related to the succeeded verifications are not included. May not be immediately available. More information on pricing is available [here](https://www.twilio.com/en-us/verify/pricing).
                    def price
                        @properties['price']
                    end
                    
                    ##
                    # @return [Hash] An object containing the channel specific information for an attempt.
                    def channel_data
                        @properties['channel_data']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the VerificationAttemptInstance
                    # @return [VerificationAttemptInstance] Fetched VerificationAttemptInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.VerificationAttemptInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.VerificationAttemptInstance #{values}>"
                    end
                end

            end
        end
    end
end

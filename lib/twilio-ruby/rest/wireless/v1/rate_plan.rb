##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Wireless
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Wireless < WirelessBase
            class V1 < Version
                class RatePlanList < ListResource
                
                    ##
                    # Initialize the RatePlanList
                    # @param [Version] version Version that contains the resource
                    # @return [RatePlanList] RatePlanList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/RatePlans"
                        
                    end
                    ##
                    # Create the RatePlanInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It does not have to be unique.
                    # @param [Boolean] data_enabled Whether SIMs can use GPRS/3G/4G/LTE data connectivity.
                    # @param [String] data_limit The total data usage (download and upload combined) in Megabytes that the Network allows during one month on the home network (T-Mobile USA). The metering period begins the day of activation and ends on the same day in the following month. Can be up to 2TB and the default value is `1000`.
                    # @param [String] data_metering The model used to meter data usage. Can be: `payg` and `quota-1`, `quota-10`, and `quota-50`. Learn more about the available [data metering models](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#payg-vs-quota-data-plans).
                    # @param [Boolean] messaging_enabled Whether SIMs can make, send, and receive SMS using [Commands](https://www.twilio.com/docs/iot/wireless/api/command-resource).
                    # @param [Boolean] voice_enabled Deprecated.
                    # @param [Boolean] national_roaming_enabled Whether SIMs can roam on networks other than the home network (T-Mobile USA) in the United States. See [national roaming](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#national-roaming).
                    # @param [Array[String]] international_roaming The list of services that SIMs capable of using GPRS/3G/4G/LTE data connectivity can use outside of the United States. Can contain: `data` and `messaging`.
                    # @param [String] national_roaming_data_limit The total data usage (download and upload combined) in Megabytes that the Network allows during one month on non-home networks in the United States. The metering period begins the day of activation and ends on the same day in the following month. Can be up to 2TB. See [national roaming](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#national-roaming) for more info.
                    # @param [String] international_roaming_data_limit The total data usage (download and upload combined) in Megabytes that the Network allows during one month when roaming outside the United States. Can be up to 2TB.
                    # @param [DataLimitStrategy] data_limit_strategy 
                    # @return [RatePlanInstance] Created RatePlanInstance
                    def create(
                        unique_name: :unset, 
                        friendly_name: :unset, 
                        data_enabled: :unset, 
                        data_limit: :unset, 
                        data_metering: :unset, 
                        messaging_enabled: :unset, 
                        voice_enabled: :unset, 
                        national_roaming_enabled: :unset, 
                        international_roaming: :unset, 
                        national_roaming_data_limit: :unset, 
                        international_roaming_data_limit: :unset, 
                        data_limit_strategy: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'FriendlyName' => friendly_name,
                            'DataEnabled' => data_enabled,
                            'DataLimit' => data_limit,
                            'DataMetering' => data_metering,
                            'MessagingEnabled' => messaging_enabled,
                            'VoiceEnabled' => voice_enabled,
                            'NationalRoamingEnabled' => national_roaming_enabled,
                            'InternationalRoaming' => Twilio.serialize_list(international_roaming) { |e| e },
                            'NationalRoamingDataLimit' => national_roaming_data_limit,
                            'InternationalRoamingDataLimit' => international_roaming_data_limit,
                            'DataLimitStrategy' => data_limit_strategy,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        RatePlanInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists RatePlanInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields RatePlanInstance records from the API.
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
                    # Retrieve a single page of RatePlanInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of RatePlanInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        RatePlanPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of RatePlanInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of RatePlanInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    RatePlanPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Wireless.V1.RatePlanList>'
                    end
                end


                class RatePlanContext < InstanceContext
                    ##
                    # Initialize the RatePlanContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the RatePlan resource to update.
                    # @return [RatePlanContext] RatePlanContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/RatePlans/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the RatePlanInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the RatePlanInstance
                    # @return [RatePlanInstance] Fetched RatePlanInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        RatePlanInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the RatePlanInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It does not have to be unique.
                    # @return [RatePlanInstance] Updated RatePlanInstance
                    def update(
                        unique_name: :unset, 
                        friendly_name: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'FriendlyName' => friendly_name,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        RatePlanInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Wireless.V1.RatePlanContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Wireless.V1.RatePlanContext #{context}>"
                    end
                end

                class RatePlanPage < Page
                    ##
                    # Initialize the RatePlanPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [RatePlanPage] RatePlanPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of RatePlanInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [RatePlanInstance] RatePlanInstance
                    def get_instance(payload)
                        RatePlanInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Wireless.V1.RatePlanPage>'
                    end
                end
                class RatePlanInstance < InstanceResource
                    ##
                    # Initialize the RatePlanInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this RatePlan
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [RatePlanInstance] RatePlanInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'unique_name' => payload['unique_name'],
                            'account_sid' => payload['account_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'data_enabled' => payload['data_enabled'],
                            'data_metering' => payload['data_metering'],
                            'data_limit' => payload['data_limit'] == nil ? payload['data_limit'] : payload['data_limit'].to_i,
                            'messaging_enabled' => payload['messaging_enabled'],
                            'voice_enabled' => payload['voice_enabled'],
                            'national_roaming_enabled' => payload['national_roaming_enabled'],
                            'national_roaming_data_limit' => payload['national_roaming_data_limit'] == nil ? payload['national_roaming_data_limit'] : payload['national_roaming_data_limit'].to_i,
                            'international_roaming' => payload['international_roaming'],
                            'international_roaming_data_limit' => payload['international_roaming_data_limit'] == nil ? payload['international_roaming_data_limit'] : payload['international_roaming_data_limit'].to_i,
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [RatePlanContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = RatePlanContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the RatePlan resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the RatePlan resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Boolean] Whether SIMs can use GPRS/3G/4G/LTE data connectivity.
                    def data_enabled
                        @properties['data_enabled']
                    end
                    
                    ##
                    # @return [String] The model used to meter data usage. Can be: `payg` and `quota-1`, `quota-10`, and `quota-50`. Learn more about the available [data metering models](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#payg-vs-quota-data-plans).
                    def data_metering
                        @properties['data_metering']
                    end
                    
                    ##
                    # @return [String] The total data usage (download and upload combined) in Megabytes that the Network allows during one month on the home network (T-Mobile USA). The metering period begins the day of activation and ends on the same day in the following month. Can be up to 2TB.
                    def data_limit
                        @properties['data_limit']
                    end
                    
                    ##
                    # @return [Boolean] Whether SIMs can make, send, and receive SMS using [Commands](https://www.twilio.com/docs/iot/wireless/api/command-resource).
                    def messaging_enabled
                        @properties['messaging_enabled']
                    end
                    
                    ##
                    # @return [Boolean] Deprecated. Whether SIMs can make and receive voice calls.
                    def voice_enabled
                        @properties['voice_enabled']
                    end
                    
                    ##
                    # @return [Boolean] Whether SIMs can roam on networks other than the home network (T-Mobile USA) in the United States. See [national roaming](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#national-roaming).
                    def national_roaming_enabled
                        @properties['national_roaming_enabled']
                    end
                    
                    ##
                    # @return [String] The total data usage (download and upload combined) in Megabytes that the Network allows during one month on non-home networks in the United States. The metering period begins the day of activation and ends on the same day in the following month. Can be up to 2TB.
                    def national_roaming_data_limit
                        @properties['national_roaming_data_limit']
                    end
                    
                    ##
                    # @return [Array<String>] The list of services that SIMs capable of using GPRS/3G/4G/LTE data connectivity can use outside of the United States. Can contain: `data` and `messaging`.
                    def international_roaming
                        @properties['international_roaming']
                    end
                    
                    ##
                    # @return [String] The total data usage (download and upload combined) in Megabytes that the Network allows during one month when roaming outside the United States. Can be up to 2TB.
                    def international_roaming_data_limit
                        @properties['international_roaming_data_limit']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the RatePlanInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the RatePlanInstance
                    # @return [RatePlanInstance] Fetched RatePlanInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the RatePlanInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It does not have to be unique.
                    # @return [RatePlanInstance] Updated RatePlanInstance
                    def update(
                        unique_name: :unset, 
                        friendly_name: :unset
                    )

                        context.update(
                            unique_name: unique_name, 
                            friendly_name: friendly_name, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Wireless.V1.RatePlanInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Wireless.V1.RatePlanInstance #{values}>"
                    end
                end

            end
        end
    end
end

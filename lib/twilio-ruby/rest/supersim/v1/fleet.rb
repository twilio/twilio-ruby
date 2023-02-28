##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Supersim
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Supersim < SupersimBase
            class V1 < Version
                class FleetList < ListResource
                    ##
                    # Initialize the FleetList
                    # @param [Version] version Version that contains the resource
                    # @return [FleetList] FleetList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Fleets"
                        
                    end
                    ##
                    # Create the FleetInstance
                    # @param [String] network_access_profile The SID or unique name of the Network Access Profile that will control which cellular networks the Fleet's SIMs can connect to.
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    # @param [Boolean] data_enabled Defines whether SIMs in the Fleet are capable of using 2G/3G/4G/LTE/CAT-M data connectivity. Defaults to `true`.
                    # @param [String] data_limit The total data usage (download and upload combined) in Megabytes that each Super SIM assigned to the Fleet can consume during a billing period (normally one month). Value must be between 1MB (1) and 2TB (2,000,000). Defaults to 1GB (1,000).
                    # @param [String] ip_commands_url The URL that will receive a webhook when a Super SIM in the Fleet is used to send an IP Command from your device to a special IP address. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    # @param [String] ip_commands_method A string representing the HTTP method to use when making a request to `ip_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.
                    # @param [Boolean] sms_commands_enabled Defines whether SIMs in the Fleet are capable of sending and receiving machine-to-machine SMS via Commands. Defaults to `true`.
                    # @param [String] sms_commands_url The URL that will receive a webhook when a Super SIM in the Fleet is used to send an SMS from your device to the SMS Commands number. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    # @param [String] sms_commands_method A string representing the HTTP method to use when making a request to `sms_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.
                    # @return [FleetInstance] Created FleetInstance
                    def create(
                        network_access_profile: nil, 
                        unique_name: :unset, 
                        data_enabled: :unset, 
                        data_limit: :unset, 
                        ip_commands_url: :unset, 
                        ip_commands_method: :unset, 
                        sms_commands_enabled: :unset, 
                        sms_commands_url: :unset, 
                        sms_commands_method: :unset
                    )

                        data = Twilio::Values.of({
                            'NetworkAccessProfile' => network_access_profile,
                            'UniqueName' => unique_name,
                            'DataEnabled' => data_enabled,
                            'DataLimit' => data_limit,
                            'IpCommandsUrl' => ip_commands_url,
                            'IpCommandsMethod' => ip_commands_method,
                            'SmsCommandsEnabled' => sms_commands_enabled,
                            'SmsCommandsUrl' => sms_commands_url,
                            'SmsCommandsMethod' => sms_commands_method,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        FleetInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists FleetInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] network_access_profile The SID or unique name of the Network Access Profile that controls which cellular networks the Fleet's SIMs can connect to.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(network_access_profile: :unset, limit: nil, page_size: nil)
                        self.stream(
                            network_access_profile: network_access_profile,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] network_access_profile The SID or unique name of the Network Access Profile that controls which cellular networks the Fleet's SIMs can connect to.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(network_access_profile: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            network_access_profile: network_access_profile,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields FleetInstance records from the API.
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
                    # Retrieve a single page of FleetInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] network_access_profile The SID or unique name of the Network Access Profile that controls which cellular networks the Fleet's SIMs can connect to.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of FleetInstance
                    def page(network_access_profile: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'NetworkAccessProfile' => network_access_profile,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        FleetPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of FleetInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of FleetInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    FleetPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Supersim.V1.FleetList>'
                    end
                end

                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class FleetContext < InstanceContext
                    ##
                    # Initialize the FleetContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Fleet resource to update.
                    # @return [FleetContext] FleetContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Fleets/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the FleetInstance
                    # @return [FleetInstance] Fetched FleetInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        FleetInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the FleetInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    # @param [String] network_access_profile The SID or unique name of the Network Access Profile that will control which cellular networks the Fleet's SIMs can connect to.
                    # @param [String] ip_commands_url The URL that will receive a webhook when a Super SIM in the Fleet is used to send an IP Command from your device to a special IP address. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    # @param [String] ip_commands_method A string representing the HTTP method to use when making a request to `ip_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.
                    # @param [String] sms_commands_url The URL that will receive a webhook when a Super SIM in the Fleet is used to send an SMS from your device to the SMS Commands number. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    # @param [String] sms_commands_method A string representing the HTTP method to use when making a request to `sms_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.
                    # @param [String] data_limit The total data usage (download and upload combined) in Megabytes that each Super SIM assigned to the Fleet can consume during a billing period (normally one month). Value must be between 1MB (1) and 2TB (2,000,000). Defaults to 1GB (1,000).
                    # @return [FleetInstance] Updated FleetInstance
                    def update(
                        unique_name: :unset, 
                        network_access_profile: :unset, 
                        ip_commands_url: :unset, 
                        ip_commands_method: :unset, 
                        sms_commands_url: :unset, 
                        sms_commands_method: :unset, 
                        data_limit: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'NetworkAccessProfile' => network_access_profile,
                            'IpCommandsUrl' => ip_commands_url,
                            'IpCommandsMethod' => ip_commands_method,
                            'SmsCommandsUrl' => sms_commands_url,
                            'SmsCommandsMethod' => sms_commands_method,
                            'DataLimit' => data_limit,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        FleetInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Supersim.V1.FleetContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Supersim.V1.FleetContext #{context}>"
                    end
                end

                class FleetPage < Page
                    ##
                    # Initialize the FleetPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [FleetPage] FleetPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of FleetInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [FleetInstance] FleetInstance
                    def get_instance(payload)
                        FleetInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Supersim.V1.FleetPage>'
                    end
                end
                class FleetInstance < InstanceResource
                    ##
                    # Initialize the FleetInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Fleet
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [FleetInstance] FleetInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'sid' => payload['sid'],
                            'unique_name' => payload['unique_name'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'data_enabled' => payload['data_enabled'],
                            'data_limit' => payload['data_limit'] == nil ? payload['data_limit'] : payload['data_limit'].to_i,
                            'data_metering' => payload['data_metering'],
                            'sms_commands_enabled' => payload['sms_commands_enabled'],
                            'sms_commands_url' => payload['sms_commands_url'],
                            'sms_commands_method' => payload['sms_commands_method'],
                            'network_access_profile_sid' => payload['network_access_profile_sid'],
                            'ip_commands_url' => payload['ip_commands_url'],
                            'ip_commands_method' => payload['ip_commands_method'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [FleetContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = FleetContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Fleet resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Fleet resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Fleet resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Boolean] Defines whether SIMs in the Fleet are capable of using 2G/3G/4G/LTE/CAT-M data connectivity. Defaults to `true`.
                    def data_enabled
                        @properties['data_enabled']
                    end
                    
                    ##
                    # @return [String] The total data usage (download and upload combined) in Megabytes that each Super SIM assigned to the Fleet can consume during a billing period (normally one month). Value must be between 1MB (1) and 2TB (2,000,000). Defaults to 1GB (1,000).
                    def data_limit
                        @properties['data_limit']
                    end
                    
                    ##
                    # @return [FleetDataMetering] 
                    def data_metering
                        @properties['data_metering']
                    end
                    
                    ##
                    # @return [Boolean] Defines whether SIMs in the Fleet are capable of sending and receiving machine-to-machine SMS via Commands. Defaults to `true`.
                    def sms_commands_enabled
                        @properties['sms_commands_enabled']
                    end
                    
                    ##
                    # @return [String] The URL that will receive a webhook when a Super SIM in the Fleet is used to send an SMS from your device to the SMS Commands number. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    def sms_commands_url
                        @properties['sms_commands_url']
                    end
                    
                    ##
                    # @return [String] A string representing the HTTP method to use when making a request to `sms_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.
                    def sms_commands_method
                        @properties['sms_commands_method']
                    end
                    
                    ##
                    # @return [String] The SID of the Network Access Profile that controls which cellular networks the Fleet's SIMs can connect to.
                    def network_access_profile_sid
                        @properties['network_access_profile_sid']
                    end
                    
                    ##
                    # @return [String] The URL that will receive a webhook when a Super SIM in the Fleet is used to send an IP Command from your device to a special IP address. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    def ip_commands_url
                        @properties['ip_commands_url']
                    end
                    
                    ##
                    # @return [String] A string representing the HTTP method to use when making a request to `ip_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.
                    def ip_commands_method
                        @properties['ip_commands_method']
                    end
                    
                    ##
                    # Fetch the FleetInstance
                    # @return [FleetInstance] Fetched FleetInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the FleetInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    # @param [String] network_access_profile The SID or unique name of the Network Access Profile that will control which cellular networks the Fleet's SIMs can connect to.
                    # @param [String] ip_commands_url The URL that will receive a webhook when a Super SIM in the Fleet is used to send an IP Command from your device to a special IP address. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    # @param [String] ip_commands_method A string representing the HTTP method to use when making a request to `ip_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.
                    # @param [String] sms_commands_url The URL that will receive a webhook when a Super SIM in the Fleet is used to send an SMS from your device to the SMS Commands number. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    # @param [String] sms_commands_method A string representing the HTTP method to use when making a request to `sms_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.
                    # @param [String] data_limit The total data usage (download and upload combined) in Megabytes that each Super SIM assigned to the Fleet can consume during a billing period (normally one month). Value must be between 1MB (1) and 2TB (2,000,000). Defaults to 1GB (1,000).
                    # @return [FleetInstance] Updated FleetInstance
                    def update(
                        unique_name: :unset, 
                        network_access_profile: :unset, 
                        ip_commands_url: :unset, 
                        ip_commands_method: :unset, 
                        sms_commands_url: :unset, 
                        sms_commands_method: :unset, 
                        data_limit: :unset
                    )

                        context.update(
                            unique_name: unique_name, 
                            network_access_profile: network_access_profile, 
                            ip_commands_url: ip_commands_url, 
                            ip_commands_method: ip_commands_method, 
                            sms_commands_url: sms_commands_url, 
                            sms_commands_method: sms_commands_method, 
                            data_limit: data_limit, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Supersim.V1.FleetInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Supersim.V1.FleetInstance #{values}>"
                    end
                end
            end
        end
    end
end

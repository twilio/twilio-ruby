##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Voice
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Voice < VoiceBase
            class V1 < Version
                class IpRecordList < ListResource
                    ##
                    # Initialize the IpRecordList
                    # @param [Version] version Version that contains the resource
                    # @return [IpRecordList] IpRecordList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/IpRecords"
                        
                    end
                    ##
                    # Create the IpRecordInstance
                    # @param [String] ip_address An IP address in dotted decimal notation, IPv4 only.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long.
                    # @param [String] cidr_prefix_length An integer representing the length of the [CIDR](https://tools.ietf.org/html/rfc4632) prefix to use with this IP address. By default the entire IP address is used, which for IPv4 is value 32.
                    # @return [IpRecordInstance] Created IpRecordInstance
                    def create(
                        ip_address: nil, 
                        friendly_name: :unset, 
                        cidr_prefix_length: :unset
                    )

                        data = Twilio::Values.of({
                            'IpAddress' => ip_address,
                            'FriendlyName' => friendly_name,
                            'CidrPrefixLength' => cidr_prefix_length,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        IpRecordInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists IpRecordInstance records from the API as a list.
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
                    # When passed a block, yields IpRecordInstance records from the API.
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
                    # Retrieve a single page of IpRecordInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of IpRecordInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        IpRecordPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of IpRecordInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of IpRecordInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    IpRecordPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Voice.V1.IpRecordList>'
                    end
                end


                class IpRecordContext < InstanceContext
                    ##
                    # Initialize the IpRecordContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The Twilio-provided string that uniquely identifies the IP Record resource to update.
                    # @return [IpRecordContext] IpRecordContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/IpRecords/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the IpRecordInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the IpRecordInstance
                    # @return [IpRecordInstance] Fetched IpRecordInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        IpRecordInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the IpRecordInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long.
                    # @return [IpRecordInstance] Updated IpRecordInstance
                    def update(
                        friendly_name: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        IpRecordInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Voice.V1.IpRecordContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Voice.V1.IpRecordContext #{context}>"
                    end
                end

                class IpRecordPage < Page
                    ##
                    # Initialize the IpRecordPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [IpRecordPage] IpRecordPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of IpRecordInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [IpRecordInstance] IpRecordInstance
                    def get_instance(payload)
                        IpRecordInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Voice.V1.IpRecordPage>'
                    end
                end
                class IpRecordInstance < InstanceResource
                    ##
                    # Initialize the IpRecordInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this IpRecord
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [IpRecordInstance] IpRecordInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'sid' => payload['sid'],
                            'friendly_name' => payload['friendly_name'],
                            'ip_address' => payload['ip_address'],
                            'cidr_prefix_length' => payload['cidr_prefix_length'] == nil ? payload['cidr_prefix_length'] : payload['cidr_prefix_length'].to_i,
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
                    # @return [IpRecordContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = IpRecordContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the IP Record resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the IP Record resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] An IP address in dotted decimal notation, IPv4 only.
                    def ip_address
                        @properties['ip_address']
                    end
                    
                    ##
                    # @return [String] An integer representing the length of the [CIDR](https://tools.ietf.org/html/rfc4632) prefix to use with this IP address. By default the entire IP address is used, which for IPv4 is value 32.
                    def cidr_prefix_length
                        @properties['cidr_prefix_length']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the IpRecordInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the IpRecordInstance
                    # @return [IpRecordInstance] Fetched IpRecordInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the IpRecordInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long.
                    # @return [IpRecordInstance] Updated IpRecordInstance
                    def update(
                        friendly_name: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Voice.V1.IpRecordInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Voice.V1.IpRecordInstance #{values}>"
                    end
                end

            end
        end
    end
end

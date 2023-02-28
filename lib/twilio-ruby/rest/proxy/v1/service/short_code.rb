##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Proxy
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Proxy < ProxyBase
            class V1 < Version
                class ServiceContext < InstanceContext

                     class ShortCodeList < ListResource
                    ##
                    # Initialize the ShortCodeList
                    # @param [Version] version Version that contains the resource
                    # @return [ShortCodeList] ShortCodeList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, }
                        @uri = "/Services/#{@solution[:service_sid]}/ShortCodes"
                        
                    end
                    ##
                    # Create the ShortCodeInstance
                    # @param [String] sid The SID of a Twilio [ShortCode](https://www.twilio.com/docs/sms/api/short-code) resource that represents the short code you would like to assign to your Proxy Service.
                    # @return [ShortCodeInstance] Created ShortCodeInstance
                    def create(
                        sid: nil
                    )

                        data = Twilio::Values.of({
                            'Sid' => sid,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        ShortCodeInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists ShortCodeInstance records from the API as a list.
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
                    # When passed a block, yields ShortCodeInstance records from the API.
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
                    # Retrieve a single page of ShortCodeInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ShortCodeInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ShortCodePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ShortCodeInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ShortCodeInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ShortCodePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Proxy.V1.ShortCodeList>'
                    end
                end

                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class ShortCodeContext < InstanceContext
                    ##
                    # Initialize the ShortCodeContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the parent [Service](https://www.twilio.com/docs/proxy/api/service) of the resource to update.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the ShortCode resource to update.
                    # @return [ShortCodeContext] ShortCodeContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/ShortCodes/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the ShortCodeInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the ShortCodeInstance
                    # @return [ShortCodeInstance] Fetched ShortCodeInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        ShortCodeInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ShortCodeInstance
                    # @param [Boolean] is_reserved Whether the short code should be reserved and not be assigned to a participant using proxy pool logic. See [Reserved Phone Numbers](https://www.twilio.com/docs/proxy/reserved-phone-numbers) for more information.
                    # @return [ShortCodeInstance] Updated ShortCodeInstance
                    def update(
                        is_reserved: :unset
                    )

                        data = Twilio::Values.of({
                            'IsReserved' => is_reserved,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        ShortCodeInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Proxy.V1.ShortCodeContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Proxy.V1.ShortCodeContext #{context}>"
                    end
                end

                class ShortCodePage < Page
                    ##
                    # Initialize the ShortCodePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ShortCodePage] ShortCodePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ShortCodeInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ShortCodeInstance] ShortCodeInstance
                    def get_instance(payload)
                        ShortCodeInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Proxy.V1.ShortCodePage>'
                    end
                end
                class ShortCodeInstance < InstanceResource
                    ##
                    # Initialize the ShortCodeInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this ShortCode
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ShortCodeInstance] ShortCodeInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'short_code' => payload['short_code'],
                            'iso_country' => payload['iso_country'],
                            'capabilities' => payload['capabilities'],
                            'url' => payload['url'],
                            'is_reserved' => payload['is_reserved'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ShortCodeContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ShortCodeContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the ShortCode resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ShortCode resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the ShortCode resource's parent [Service](https://www.twilio.com/docs/proxy/api/service) resource.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was created.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was last updated.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The short code's number.
                    def short_code
                        @properties['short_code']
                    end
                    
                    ##
                    # @return [String] The ISO Country Code for the short code.
                    def iso_country
                        @properties['iso_country']
                    end
                    
                    ##
                    # @return [ProxyV1ServiceShortCodeCapabilities] 
                    def capabilities
                        @properties['capabilities']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the ShortCode resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Boolean] Whether the short code should be reserved and not be assigned to a participant using proxy pool logic. See [Reserved Phone Numbers](https://www.twilio.com/docs/proxy/reserved-phone-numbers) for more information.
                    def is_reserved
                        @properties['is_reserved']
                    end
                    
                    ##
                    # Delete the ShortCodeInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the ShortCodeInstance
                    # @return [ShortCodeInstance] Fetched ShortCodeInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ShortCodeInstance
                    # @param [Boolean] is_reserved Whether the short code should be reserved and not be assigned to a participant using proxy pool logic. See [Reserved Phone Numbers](https://www.twilio.com/docs/proxy/reserved-phone-numbers) for more information.
                    # @return [ShortCodeInstance] Updated ShortCodeInstance
                    def update(
                        is_reserved: :unset
                    )

                        context.update(
                            is_reserved: is_reserved, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Proxy.V1.ShortCodeInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Proxy.V1.ShortCodeInstance #{values}>"
                    end
                end
             end
            end
        end
    end
end



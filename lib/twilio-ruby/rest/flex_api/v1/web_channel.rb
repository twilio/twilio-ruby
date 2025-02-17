##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class WebChannelList < ListResource
                
                    ##
                    # Initialize the WebChannelList
                    # @param [Version] version Version that contains the resource
                    # @return [WebChannelList] WebChannelList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/WebChannels"
                        
                    end
                    ##
                    # Create the WebChannelInstance
                    # @param [String] flex_flow_sid The SID of the Flex Flow.
                    # @param [String] identity The chat identity.
                    # @param [String] customer_friendly_name The chat participant's friendly name.
                    # @param [String] chat_friendly_name The chat channel's friendly name.
                    # @param [String] chat_unique_name The chat channel's unique name.
                    # @param [String] pre_engagement_data The pre-engagement data.
                    # @return [WebChannelInstance] Created WebChannelInstance
                    def create(
                        flex_flow_sid: nil, 
                        identity: nil, 
                        customer_friendly_name: nil, 
                        chat_friendly_name: nil, 
                        chat_unique_name: :unset, 
                        pre_engagement_data: :unset
                    )

                        data = Twilio::Values.of({
                            'FlexFlowSid' => flex_flow_sid,
                            'Identity' => identity,
                            'CustomerFriendlyName' => customer_friendly_name,
                            'ChatFriendlyName' => chat_friendly_name,
                            'ChatUniqueName' => chat_unique_name,
                            'PreEngagementData' => pre_engagement_data,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        WebChannelInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists WebChannelInstance records from the API as a list.
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
                    # When passed a block, yields WebChannelInstance records from the API.
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
                    # Retrieve a single page of WebChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of WebChannelInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        WebChannelPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of WebChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of WebChannelInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    WebChannelPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.WebChannelList>'
                    end
                end


                class WebChannelContext < InstanceContext
                    ##
                    # Initialize the WebChannelContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the WebChannel resource to update.
                    # @return [WebChannelContext] WebChannelContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/WebChannels/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the WebChannelInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the WebChannelInstance
                    # @return [WebChannelInstance] Fetched WebChannelInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        WebChannelInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the WebChannelInstance
                    # @param [ChatStatus] chat_status 
                    # @param [String] post_engagement_data The post-engagement data.
                    # @return [WebChannelInstance] Updated WebChannelInstance
                    def update(
                        chat_status: :unset, 
                        post_engagement_data: :unset
                    )

                        data = Twilio::Values.of({
                            'ChatStatus' => chat_status,
                            'PostEngagementData' => post_engagement_data,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        WebChannelInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.WebChannelContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.WebChannelContext #{context}>"
                    end
                end

                class WebChannelPage < Page
                    ##
                    # Initialize the WebChannelPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [WebChannelPage] WebChannelPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of WebChannelInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [WebChannelInstance] WebChannelInstance
                    def get_instance(payload)
                        WebChannelInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.WebChannelPage>'
                    end
                end
                class WebChannelInstance < InstanceResource
                    ##
                    # Initialize the WebChannelInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this WebChannel
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [WebChannelInstance] WebChannelInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'flex_flow_sid' => payload['flex_flow_sid'],
                            'sid' => payload['sid'],
                            'url' => payload['url'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [WebChannelContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = WebChannelContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the WebChannel resource and owns this Workflow.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Flex Flow.
                    def flex_flow_sid
                        @properties['flex_flow_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the WebChannel resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the WebChannel resource.
                    def url
                        @properties['url']
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
                    # Delete the WebChannelInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the WebChannelInstance
                    # @return [WebChannelInstance] Fetched WebChannelInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the WebChannelInstance
                    # @param [ChatStatus] chat_status 
                    # @param [String] post_engagement_data The post-engagement data.
                    # @return [WebChannelInstance] Updated WebChannelInstance
                    def update(
                        chat_status: :unset, 
                        post_engagement_data: :unset
                    )

                        context.update(
                            chat_status: chat_status, 
                            post_engagement_data: post_engagement_data, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.WebChannelInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.WebChannelInstance #{values}>"
                    end
                end

            end
        end
    end
end

##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Events
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Events < EventsBase
            class V1 < Version
                class SubscriptionList < ListResource
                
                    ##
                    # Initialize the SubscriptionList
                    # @param [Version] version Version that contains the resource
                    # @return [SubscriptionList] SubscriptionList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Subscriptions"
                        
                    end
                    ##
                    # Create the SubscriptionInstance
                    # @param [String] description A human readable description for the Subscription **This value should not contain PII.**
                    # @param [String] sink_sid The SID of the sink that events selected by this subscription should be sent to. Sink must be active for the subscription to be created.
                    # @param [Array[Hash]] types An array of objects containing the subscribed Event Types
                    # @return [SubscriptionInstance] Created SubscriptionInstance
                    def create(
                        description: nil, 
                        sink_sid: nil, 
                        types: nil
                    )

                        data = Twilio::Values.of({
                            'Description' => description,
                            'SinkSid' => sink_sid,
                            'Types' => Twilio.serialize_list(types) { |e| Twilio.serialize_object(e) },
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        SubscriptionInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists SubscriptionInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] sink_sid The SID of the sink that the list of Subscriptions should be filtered by.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(sink_sid: :unset, limit: nil, page_size: nil)
                        self.stream(
                            sink_sid: sink_sid,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] sink_sid The SID of the sink that the list of Subscriptions should be filtered by.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(sink_sid: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            sink_sid: sink_sid,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields SubscriptionInstance records from the API.
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
                    # Retrieve a single page of SubscriptionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] sink_sid The SID of the sink that the list of Subscriptions should be filtered by.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SubscriptionInstance
                    def page(sink_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'SinkSid' => sink_sid,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        SubscriptionPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SubscriptionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SubscriptionInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SubscriptionPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Events.V1.SubscriptionList>'
                    end
                end


                class SubscriptionContext < InstanceContext
                    ##
                    # Initialize the SubscriptionContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid A 34 character string that uniquely identifies this Subscription.
                    # @return [SubscriptionContext] SubscriptionContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Subscriptions/#{@solution[:sid]}"

                        # Dependents
                        @subscribed_events = nil
                    end
                    ##
                    # Delete the SubscriptionInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the SubscriptionInstance
                    # @return [SubscriptionInstance] Fetched SubscriptionInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        SubscriptionInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the SubscriptionInstance
                    # @param [String] description A human readable description for the Subscription.
                    # @param [String] sink_sid The SID of the sink that events selected by this subscription should be sent to. Sink must be active for the subscription to be created.
                    # @return [SubscriptionInstance] Updated SubscriptionInstance
                    def update(
                        description: :unset, 
                        sink_sid: :unset
                    )

                        data = Twilio::Values.of({
                            'Description' => description,
                            'SinkSid' => sink_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        SubscriptionInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the subscribed_events
                    # @return [SubscribedEventList]
                    # @return [SubscribedEventContext] if sid was passed.
                    def subscribed_events(type=:unset)

                        raise ArgumentError, 'type cannot be nil' if type.nil?

                        if type != :unset
                            return SubscribedEventContext.new(@version, @solution[:sid],type )
                        end

                        unless @subscribed_events
                            @subscribed_events = SubscribedEventList.new(
                                @version, subscription_sid: @solution[:sid], )
                        end

                     @subscribed_events
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Events.V1.SubscriptionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Events.V1.SubscriptionContext #{context}>"
                    end
                end

                class SubscriptionPage < Page
                    ##
                    # Initialize the SubscriptionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SubscriptionPage] SubscriptionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SubscriptionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SubscriptionInstance] SubscriptionInstance
                    def get_instance(payload)
                        SubscriptionInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Events.V1.SubscriptionPage>'
                    end
                end
                class SubscriptionInstance < InstanceResource
                    ##
                    # Initialize the SubscriptionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Subscription
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SubscriptionInstance] SubscriptionInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'sid' => payload['sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'description' => payload['description'],
                            'sink_sid' => payload['sink_sid'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SubscriptionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SubscriptionContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Subscription.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [Time] The date that this Subscription was created, given in ISO 8601 format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this Subscription was updated, given in ISO 8601 format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] A human readable description for the Subscription
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [String] The SID of the sink that events selected by this subscription should be sent to. Sink must be active for the subscription to be created.
                    def sink_sid
                        @properties['sink_sid']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] Contains a dictionary of URL links to nested resources of this Subscription.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the SubscriptionInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the SubscriptionInstance
                    # @return [SubscriptionInstance] Fetched SubscriptionInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SubscriptionInstance
                    # @param [String] description A human readable description for the Subscription.
                    # @param [String] sink_sid The SID of the sink that events selected by this subscription should be sent to. Sink must be active for the subscription to be created.
                    # @return [SubscriptionInstance] Updated SubscriptionInstance
                    def update(
                        description: :unset, 
                        sink_sid: :unset
                    )

                        context.update(
                            description: description, 
                            sink_sid: sink_sid, 
                        )
                    end

                    ##
                    # Access the subscribed_events
                    # @return [subscribed_events] subscribed_events
                    def subscribed_events
                        context.subscribed_events
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Events.V1.SubscriptionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Events.V1.SubscriptionInstance #{values}>"
                    end
                end

            end
        end
    end
end

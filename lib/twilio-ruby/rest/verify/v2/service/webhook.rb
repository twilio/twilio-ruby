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
                class ServiceContext < InstanceContext

                     class WebhookList < ListResource
                    ##
                    # Initialize the WebhookList
                    # @param [Version] version Version that contains the resource
                    # @return [WebhookList] WebhookList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, }
                        @uri = "/Services/#{@solution[:service_sid]}/Webhooks"
                        
                    end
                    ##
                    # Create the WebhookInstance
                    # @param [String] friendly_name The string that you assigned to describe the webhook. **This value should not contain PII.**
                    # @param [Array[String]] event_types The array of events that this Webhook is subscribed to. Possible event types: `*, factor.deleted, factor.created, factor.verified, challenge.approved, challenge.denied`
                    # @param [String] webhook_url The URL associated with this Webhook.
                    # @param [WebhookStatus] status 
                    # @param [WebhookVersion] version 
                    # @return [WebhookInstance] Created WebhookInstance
                    def create(
                        friendly_name: nil, 
                        event_types: nil, 
                        webhook_url: nil, 
                        status: :unset, 
                        version: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'EventTypes' => Twilio.serialize_list(event_types) { |e| e },
                            'WebhookUrl' => webhook_url,
                            'Status' => status,
                            'Version' => version,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        WebhookInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists WebhookInstance records from the API as a list.
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
                    # When passed a block, yields WebhookInstance records from the API.
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
                    # Retrieve a single page of WebhookInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of WebhookInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        WebhookPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of WebhookInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of WebhookInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    WebhookPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.WebhookList>'
                    end
                end

                class WebhookContext < InstanceContext
                    ##
                    # Initialize the WebhookContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The unique SID identifier of the Service.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Webhook resource to update.
                    # @return [WebhookContext] WebhookContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Webhooks/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the WebhookInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the WebhookInstance
                    # @return [WebhookInstance] Fetched WebhookInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        WebhookInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the WebhookInstance
                    # @param [String] friendly_name The string that you assigned to describe the webhook. **This value should not contain PII.**
                    # @param [Array[String]] event_types The array of events that this Webhook is subscribed to. Possible event types: `*, factor.deleted, factor.created, factor.verified, challenge.approved, challenge.denied`
                    # @param [String] webhook_url The URL associated with this Webhook.
                    # @param [WebhookStatus] status 
                    # @param [WebhookVersion] version 
                    # @return [WebhookInstance] Updated WebhookInstance
                    def update(
                        friendly_name: :unset, 
                        event_types: :unset, 
                        webhook_url: :unset, 
                        status: :unset, 
                        version: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'EventTypes' => Twilio.serialize_list(event_types) { |e| e },
                            'WebhookUrl' => webhook_url,
                            'Status' => status,
                            'Version' => version,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        WebhookInstance.new(
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
                        "#<Twilio.Verify.V2.WebhookContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.WebhookContext #{context}>"
                    end
                end

                class WebhookPage < Page
                    ##
                    # Initialize the WebhookPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [WebhookPage] WebhookPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of WebhookInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [WebhookInstance] WebhookInstance
                    def get_instance(payload)
                        WebhookInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.WebhookPage>'
                    end
                end
                class WebhookInstance < InstanceResource
                    ##
                    # Initialize the WebhookInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Webhook
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [WebhookInstance] WebhookInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'service_sid' => payload['service_sid'],
                            'account_sid' => payload['account_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'event_types' => payload['event_types'],
                            'status' => payload['status'],
                            'version' => payload['version'],
                            'webhook_url' => payload['webhook_url'],
                            'webhook_method' => payload['webhook_method'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [WebhookContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = WebhookContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Webhook resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Service.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the webhook. **This value should not contain PII.**
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Array<String>] The array of events that this Webhook is subscribed to. Possible event types: `*, factor.deleted, factor.created, factor.verified, challenge.approved, challenge.denied`
                    def event_types
                        @properties['event_types']
                    end
                    
                    ##
                    # @return [WebhookStatus] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [WebhookVersion] 
                    def version
                        @properties['version']
                    end
                    
                    ##
                    # @return [String] The URL associated with this Webhook.
                    def webhook_url
                        @properties['webhook_url']
                    end
                    
                    ##
                    # @return [WebhookMethods] 
                    def webhook_method
                        @properties['webhook_method']
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
                    # @return [String] The absolute URL of the Webhook resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the WebhookInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the WebhookInstance
                    # @return [WebhookInstance] Fetched WebhookInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the WebhookInstance
                    # @param [String] friendly_name The string that you assigned to describe the webhook. **This value should not contain PII.**
                    # @param [Array[String]] event_types The array of events that this Webhook is subscribed to. Possible event types: `*, factor.deleted, factor.created, factor.verified, challenge.approved, challenge.denied`
                    # @param [String] webhook_url The URL associated with this Webhook.
                    # @param [WebhookStatus] status 
                    # @param [WebhookVersion] version 
                    # @return [WebhookInstance] Updated WebhookInstance
                    def update(
                        friendly_name: :unset, 
                        event_types: :unset, 
                        webhook_url: :unset, 
                        status: :unset, 
                        version: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            event_types: event_types, 
                            webhook_url: webhook_url, 
                            status: status, 
                            version: version, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.WebhookInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.WebhookInstance #{values}>"
                    end
                end
             end
            end
        end
    end
end



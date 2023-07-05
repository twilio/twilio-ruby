##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Studio
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Studio < StudioBase
            class V1 < Version
                class FlowContext < InstanceContext

                     class ExecutionList < ListResource
                    ##
                    # Initialize the ExecutionList
                    # @param [Version] version Version that contains the resource
                    # @return [ExecutionList] ExecutionList
                    def initialize(version, flow_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { flow_sid: flow_sid }
                        @uri = "/Flows/#{@solution[:flow_sid]}/Executions"
                        
                    end
                    ##
                    # Create the ExecutionInstance
                    # @param [String] to The Contact phone number to start a Studio Flow Execution, available as variable `{{contact.channel.address}}`.
                    # @param [String] from The Twilio phone number to send messages or initiate calls from during the Flow's Execution. Available as variable `{{flow.channel.address}}`. For SMS, this can also be a Messaging Service SID.
                    # @param [Object] parameters JSON data that will be added to the Flow's context and that can be accessed as variables inside your Flow. For example, if you pass in `Parameters={\\\"name\\\":\\\"Zeke\\\"}`, a widget in your Flow can reference the variable `{{flow.data.name}}`, which returns \\\"Zeke\\\". Note: the JSON value must explicitly be passed as a string, not as a hash object. Depending on your particular HTTP library, you may need to add quotes or URL encode the JSON string.
                    # @return [ExecutionInstance] Created ExecutionInstance
                    def create(
                        to: nil, 
                        from: nil, 
                        parameters: :unset
                    )

                        data = Twilio::Values.of({
                            'To' => to,
                            'From' => from,
                            'Parameters' => Twilio.serialize_object(parameters),
                        })

                        payload = @version.create('POST', @uri, data: data)
                        ExecutionInstance.new(
                            @version,
                            payload,
                            flow_sid: @solution[:flow_sid],
                        )
                    end

                
                    ##
                    # Lists ExecutionInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Time] date_created_from Only show Execution resources starting on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
                    # @param [Time] date_created_to Only show Execution resources starting before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(date_created_from: :unset, date_created_to: :unset, limit: nil, page_size: nil)
                        self.stream(
                            date_created_from: date_created_from,
                            date_created_to: date_created_to,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Time] date_created_from Only show Execution resources starting on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
                    # @param [Time] date_created_to Only show Execution resources starting before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(date_created_from: :unset, date_created_to: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            date_created_from: date_created_from,
                            date_created_to: date_created_to,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields ExecutionInstance records from the API.
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
                    # Retrieve a single page of ExecutionInstance records from the API.
                    # Request is executed immediately.
                    # @param [Time] date_created_from Only show Execution resources starting on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
                    # @param [Time] date_created_to Only show Execution resources starting before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ExecutionInstance
                    def page(date_created_from: :unset, date_created_to: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'DateCreatedFrom' =>  Twilio.serialize_iso8601_datetime(date_created_from),
                                                        
                            'DateCreatedTo' =>  Twilio.serialize_iso8601_datetime(date_created_to),
                                                        
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ExecutionPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ExecutionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ExecutionInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ExecutionPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Studio.V1.ExecutionList>'
                    end
                end


                class ExecutionContext < InstanceContext
                    ##
                    # Initialize the ExecutionContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] flow_sid The SID of the Flow with the Execution resources to update.
                    # @param [String] sid The SID of the Execution resource to update.
                    # @return [ExecutionContext] ExecutionContext
                    def initialize(version, flow_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { flow_sid: flow_sid, sid: sid,  }
                        @uri = "/Flows/#{@solution[:flow_sid]}/Executions/#{@solution[:sid]}"

                        # Dependents
                        @execution_context = nil
                        @steps = nil
                    end
                    ##
                    # Delete the ExecutionInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the ExecutionInstance
                    # @return [ExecutionInstance] Fetched ExecutionInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        ExecutionInstance.new(
                            @version,
                            payload,
                            flow_sid: @solution[:flow_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ExecutionInstance
                    # @param [Status] status 
                    # @return [ExecutionInstance] Updated ExecutionInstance
                    def update(
                        status: nil
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        ExecutionInstance.new(
                            @version,
                            payload,
                            flow_sid: @solution[:flow_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the execution_context
                    # @return [ExecutionContextList]
                    # @return [ExecutionContextContext]
                    def execution_context
                        ExecutionContextContext.new(
                                @version,
                                @solution[:flow_sid],
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the steps
                    # @return [ExecutionStepList]
                    # @return [ExecutionStepContext] if sid was passed.
                    def steps(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return ExecutionStepContext.new(@version, @solution[:flow_sid], @solution[:sid],sid )
                        end

                        unless @steps
                            @steps = ExecutionStepList.new(
                                @version, flow_sid: @solution[:flow_sid],  execution_sid: @solution[:sid], )
                        end

                     @steps
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Studio.V1.ExecutionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Studio.V1.ExecutionContext #{context}>"
                    end
                end

                class ExecutionPage < Page
                    ##
                    # Initialize the ExecutionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ExecutionPage] ExecutionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ExecutionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ExecutionInstance] ExecutionInstance
                    def get_instance(payload)
                        ExecutionInstance.new(@version, payload, flow_sid: @solution[:flow_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Studio.V1.ExecutionPage>'
                    end
                end
                class ExecutionInstance < InstanceResource
                    ##
                    # Initialize the ExecutionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Execution
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ExecutionInstance] ExecutionInstance
                    def initialize(version, payload , flow_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'flow_sid' => payload['flow_sid'],
                            'contact_sid' => payload['contact_sid'],
                            'contact_channel_address' => payload['contact_channel_address'],
                            'context' => payload['context'],
                            'status' => payload['status'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'flow_sid' => flow_sid  || @properties['flow_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ExecutionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ExecutionContext.new(@version , @params['flow_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Execution resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Execution resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Flow.
                    def flow_sid
                        @properties['flow_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Contact.
                    def contact_sid
                        @properties['contact_sid']
                    end
                    
                    ##
                    # @return [String] The phone number, SIP address or Client identifier that triggered the Execution. Phone numbers are in E.164 format (e.g. +16175551212). SIP addresses are formatted as `name@company.com`. Client identifiers are formatted `client:name`.
                    def contact_channel_address
                        @properties['contact_channel_address']
                    end
                    
                    ##
                    # @return [Hash] The current state of the Flow's Execution. As a flow executes, we save its state in this context. We save data that your widgets can access as variables in configuration fields or in text areas as variable substitution.
                    def context
                        @properties['context']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
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
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of nested resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the ExecutionInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the ExecutionInstance
                    # @return [ExecutionInstance] Fetched ExecutionInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ExecutionInstance
                    # @param [Status] status 
                    # @return [ExecutionInstance] Updated ExecutionInstance
                    def update(
                        status: nil
                    )

                        context.update(
                            status: status, 
                        )
                    end

                    ##
                    # Access the execution_context
                    # @return [execution_context] execution_context
                    def execution_context
                        context.execution_context
                    end

                    ##
                    # Access the steps
                    # @return [steps] steps
                    def steps
                        context.steps
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Studio.V1.ExecutionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Studio.V1.ExecutionInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end



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
                class SinkList < ListResource
                
                    ##
                    # Initialize the SinkList
                    # @param [Version] version Version that contains the resource
                    # @return [SinkList] SinkList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Sinks"
                        
                    end
                    ##
                    # Create the SinkInstance
                    # @param [String] description A human readable description for the Sink **This value should not contain PII.**
                    # @param [Object] sink_configuration The information required for Twilio to connect to the provided Sink encoded as JSON.
                    # @param [SinkType] sink_type 
                    # @return [SinkInstance] Created SinkInstance
                    def create(
                        description: nil, 
                        sink_configuration: nil, 
                        sink_type: nil
                    )

                        data = Twilio::Values.of({
                            'Description' => description,
                            'SinkConfiguration' => Twilio.serialize_object(sink_configuration),
                            'SinkType' => sink_type,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        SinkInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists SinkInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Boolean] in_use A boolean query parameter filtering the results to return sinks used/not used by a subscription.
                    # @param [String] status A String query parameter filtering the results by status `initialized`, `validating`, `active` or `failed`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(in_use: :unset, status: :unset, limit: nil, page_size: nil)
                        self.stream(
                            in_use: in_use,
                            status: status,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Boolean] in_use A boolean query parameter filtering the results to return sinks used/not used by a subscription.
                    # @param [String] status A String query parameter filtering the results by status `initialized`, `validating`, `active` or `failed`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(in_use: :unset, status: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            in_use: in_use,
                            status: status,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields SinkInstance records from the API.
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
                    # Retrieve a single page of SinkInstance records from the API.
                    # Request is executed immediately.
                    # @param [Boolean] in_use A boolean query parameter filtering the results to return sinks used/not used by a subscription.
                    # @param [String] status A String query parameter filtering the results by status `initialized`, `validating`, `active` or `failed`.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SinkInstance
                    def page(in_use: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'InUse' => in_use,
                            'Status' => status,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        SinkPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SinkInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SinkInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SinkPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Events.V1.SinkList>'
                    end
                end


                class SinkContext < InstanceContext
                    ##
                    # Initialize the SinkContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid A 34 character string that uniquely identifies this Sink.
                    # @return [SinkContext] SinkContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Sinks/#{@solution[:sid]}"

                        # Dependents
                        @sink_test = nil
                        @sink_validate = nil
                    end
                    ##
                    # Delete the SinkInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the SinkInstance
                    # @return [SinkInstance] Fetched SinkInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        SinkInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the SinkInstance
                    # @param [String] description A human readable description for the Sink **This value should not contain PII.**
                    # @return [SinkInstance] Updated SinkInstance
                    def update(
                        description: nil
                    )

                        data = Twilio::Values.of({
                            'Description' => description,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        SinkInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the sink_test
                    # @return [SinkTestList]
                    # @return [SinkTestContext]
                    def sink_test
                      unless @sink_test
                        @sink_test = SinkTestList.new(
                                @version, sid: @solution[:sid], )
                      end
                      @sink_test
                    end
                    ##
                    # Access the sink_validate
                    # @return [SinkValidateList]
                    # @return [SinkValidateContext]
                    def sink_validate
                      unless @sink_validate
                        @sink_validate = SinkValidateList.new(
                                @version, sid: @solution[:sid], )
                      end
                      @sink_validate
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Events.V1.SinkContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Events.V1.SinkContext #{context}>"
                    end
                end

                class SinkPage < Page
                    ##
                    # Initialize the SinkPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SinkPage] SinkPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SinkInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SinkInstance] SinkInstance
                    def get_instance(payload)
                        SinkInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Events.V1.SinkPage>'
                    end
                end
                class SinkInstance < InstanceResource
                    ##
                    # Initialize the SinkInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Sink
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SinkInstance] SinkInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'description' => payload['description'],
                            'sid' => payload['sid'],
                            'sink_configuration' => payload['sink_configuration'],
                            'sink_type' => payload['sink_type'],
                            'status' => payload['status'],
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
                    # @return [SinkContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SinkContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [Time] The date that this Sink was created, given in ISO 8601 format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this Sink was updated, given in ISO 8601 format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] A human readable description for the Sink
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Sink.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [Hash] The information required for Twilio to connect to the provided Sink encoded as JSON.
                    def sink_configuration
                        @properties['sink_configuration']
                    end
                    
                    ##
                    # @return [SinkType] 
                    def sink_type
                        @properties['sink_type']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] Contains a dictionary of URL links to nested resources of this Sink.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the SinkInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the SinkInstance
                    # @return [SinkInstance] Fetched SinkInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SinkInstance
                    # @param [String] description A human readable description for the Sink **This value should not contain PII.**
                    # @return [SinkInstance] Updated SinkInstance
                    def update(
                        description: nil
                    )

                        context.update(
                            description: description, 
                        )
                    end

                    ##
                    # Access the sink_test
                    # @return [sink_test] sink_test
                    def sink_test
                        context.sink_test
                    end

                    ##
                    # Access the sink_validate
                    # @return [sink_validate] sink_validate
                    def sink_validate
                        context.sink_validate
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Events.V1.SinkInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Events.V1.SinkInstance #{values}>"
                    end
                end

            end
        end
    end
end

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
                class SchemaContext < InstanceContext

                     class SchemaVersionList < ListResource
                    ##
                    # Initialize the SchemaVersionList
                    # @param [Version] version Version that contains the resource
                    # @return [SchemaVersionList] SchemaVersionList
                    def initialize(version, id: nil)
                        super(version)
                        # Path Solution
                        @solution = { id: id }
                        @uri = "/Schemas/#{@solution[:id]}/Versions"
                        
                    end
                
                    ##
                    # Lists SchemaVersionInstance records from the API as a list.
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
                    # When passed a block, yields SchemaVersionInstance records from the API.
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
                    # Retrieve a single page of SchemaVersionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SchemaVersionInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        SchemaVersionPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SchemaVersionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SchemaVersionInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SchemaVersionPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Events.V1.SchemaVersionList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class SchemaVersionContext < InstanceContext
                    ##
                    # Initialize the SchemaVersionContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] id The unique identifier of the schema. Each schema can have multiple versions, that share the same id.
                    # @param [String] schema_version The version of the schema
                    # @return [SchemaVersionContext] SchemaVersionContext
                    def initialize(version, id, schema_version)
                        super(version)

                        # Path Solution
                        @solution = { id: id, schema_version: schema_version,  }
                        @uri = "/Schemas/#{@solution[:id]}/Versions/#{@solution[:schema_version]}"

                        
                    end
                    ##
                    # Fetch the SchemaVersionInstance
                    # @return [SchemaVersionInstance] Fetched SchemaVersionInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        SchemaVersionInstance.new(
                            @version,
                            payload,
                            id: @solution[:id],
                            schema_version: @solution[:schema_version],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Events.V1.SchemaVersionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Events.V1.SchemaVersionContext #{context}>"
                    end
                end

                class SchemaVersionPage < Page
                    ##
                    # Initialize the SchemaVersionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SchemaVersionPage] SchemaVersionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SchemaVersionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SchemaVersionInstance] SchemaVersionInstance
                    def get_instance(payload)
                        SchemaVersionInstance.new(@version, payload, id: @solution[:id])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Events.V1.SchemaVersionPage>'
                    end
                end
                class SchemaVersionInstance < InstanceResource
                    ##
                    # Initialize the SchemaVersionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SchemaVersion
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SchemaVersionInstance] SchemaVersionInstance
                    def initialize(version, payload , id: nil, schema_version: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'id' => payload['id'],
                            'schema_version' => payload['schema_version'] == nil ? payload['schema_version'] : payload['schema_version'].to_i,
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'url' => payload['url'],
                            'raw' => payload['raw'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'id' => id  || @properties['id']  ,'schema_version' => schema_version  || @properties['schema_version']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SchemaVersionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SchemaVersionContext.new(@version , @params['id'], @params['schema_version'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique identifier of the schema. Each schema can have multiple versions, that share the same id.
                    def id
                        @properties['id']
                    end
                    
                    ##
                    # @return [String] The version of this schema.
                    def schema_version
                        @properties['schema_version']
                    end
                    
                    ##
                    # @return [Time] The date the schema version was created, given in ISO 8601 format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] 
                    def raw
                        @properties['raw']
                    end
                    
                    ##
                    # Fetch the SchemaVersionInstance
                    # @return [SchemaVersionInstance] Fetched SchemaVersionInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Events.V1.SchemaVersionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Events.V1.SchemaVersionInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end



##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Microvisor
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Microvisor < MicrovisorBase
            class V1 < Version
                class AccountSecretList < ListResource
                
                    ##
                    # Initialize the AccountSecretList
                    # @param [Version] version Version that contains the resource
                    # @return [AccountSecretList] AccountSecretList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Secrets"
                        
                    end
                    ##
                    # Create the AccountSecretInstance
                    # @param [String] key The secret key; up to 100 characters.
                    # @param [String] value The secret value; up to 4096 characters.
                    # @return [AccountSecretInstance] Created AccountSecretInstance
                    def create(
                        key: nil, 
                        value: nil
                    )

                        data = Twilio::Values.of({
                            'Key' => key,
                            'Value' => value,
                        })

                        
                        payload = @version.create('POST', @uri, data: data)
                        AccountSecretInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists AccountSecretInstance records from the API as a list.
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
                    # When passed a block, yields AccountSecretInstance records from the API.
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
                    # Retrieve a single page of AccountSecretInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AccountSecretInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        AccountSecretPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AccountSecretInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AccountSecretInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AccountSecretPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Microvisor.V1.AccountSecretList>'
                    end
                end


                class AccountSecretContext < InstanceContext
                    ##
                    # Initialize the AccountSecretContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] key The secret key; up to 100 characters.
                    # @return [AccountSecretContext] AccountSecretContext
                    def initialize(version, key)
                        super(version)

                        # Path Solution
                        @solution = { key: key,  }
                        @uri = "/Secrets/#{@solution[:key]}"

                        
                    end
                    ##
                    # Delete the AccountSecretInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        
                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the AccountSecretInstance
                    # @return [AccountSecretInstance] Fetched AccountSecretInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        AccountSecretInstance.new(
                            @version,
                            payload,
                            key: @solution[:key],
                        )
                    end

                    ##
                    # Update the AccountSecretInstance
                    # @param [String] value The secret value; up to 4096 characters.
                    # @return [AccountSecretInstance] Updated AccountSecretInstance
                    def update(
                        value: nil
                    )

                        data = Twilio::Values.of({
                            'Value' => value,
                        })

                        
                        payload = @version.update('POST', @uri, data: data)
                        AccountSecretInstance.new(
                            @version,
                            payload,
                            key: @solution[:key],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Microvisor.V1.AccountSecretContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Microvisor.V1.AccountSecretContext #{context}>"
                    end
                end

                class AccountSecretPage < Page
                    ##
                    # Initialize the AccountSecretPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AccountSecretPage] AccountSecretPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AccountSecretInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AccountSecretInstance] AccountSecretInstance
                    def get_instance(payload)
                        AccountSecretInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Microvisor.V1.AccountSecretPage>'
                    end
                end
                class AccountSecretInstance < InstanceResource
                    ##
                    # Initialize the AccountSecretInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this AccountSecret
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AccountSecretInstance] AccountSecretInstance
                    def initialize(version, payload , key: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'key' => payload['key'],
                            'date_rotated' => Twilio.deserialize_iso8601_datetime(payload['date_rotated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'key' => key  || @properties['key']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AccountSecretContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AccountSecretContext.new(@version , @params['key'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The secret key; up to 100 characters.
                    def key
                        @properties['key']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_rotated
                        @properties['date_rotated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Secret.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the AccountSecretInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the AccountSecretInstance
                    # @return [AccountSecretInstance] Fetched AccountSecretInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the AccountSecretInstance
                    # @param [String] value The secret value; up to 4096 characters.
                    # @return [AccountSecretInstance] Updated AccountSecretInstance
                    def update(
                        value: nil
                    )

                        context.update(
                            value: value, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Microvisor.V1.AccountSecretInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Microvisor.V1.AccountSecretInstance #{values}>"
                    end
                end

            end
        end
    end
end

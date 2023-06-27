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

                     class AccessTokenList < ListResource
                    ##
                    # Initialize the AccessTokenList
                    # @param [Version] version Version that contains the resource
                    # @return [AccessTokenList] AccessTokenList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/AccessTokens"
                        
                    end
                    ##
                    # Create the AccessTokenInstance
                    # @param [String] identity The unique external identifier for the Entity of the Service. This identifier should be immutable, not PII, and generated by your external system, such as your user's UUID, GUID, or SID.
                    # @param [FactorTypes] factor_type 
                    # @param [String] factor_friendly_name The friendly name of the factor that is going to be created with this access token
                    # @param [String] ttl How long, in seconds, the access token is valid. Can be an integer between 60 and 300. Default is 60.
                    # @return [AccessTokenInstance] Created AccessTokenInstance
                    def create(
                        identity: nil, 
                        factor_type: nil, 
                        factor_friendly_name: :unset, 
                        ttl: :unset
                    )

                        data = Twilio::Values.of({
                            'Identity' => identity,
                            'FactorType' => factor_type,
                            'FactorFriendlyName' => factor_friendly_name,
                            'Ttl' => ttl,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        AccessTokenInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.AccessTokenList>'
                    end
                end


                class AccessTokenContext < InstanceContext
                    ##
                    # Initialize the AccessTokenContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The unique SID identifier of the Service.
                    # @param [String] sid A 34 character string that uniquely identifies this Access Token.
                    # @return [AccessTokenContext] AccessTokenContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/AccessTokens/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the AccessTokenInstance
                    # @return [AccessTokenInstance] Fetched AccessTokenInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        AccessTokenInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.AccessTokenContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.AccessTokenContext #{context}>"
                    end
                end

                class AccessTokenPage < Page
                    ##
                    # Initialize the AccessTokenPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AccessTokenPage] AccessTokenPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AccessTokenInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AccessTokenInstance] AccessTokenInstance
                    def get_instance(payload)
                        AccessTokenInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.AccessTokenPage>'
                    end
                end
                class AccessTokenInstance < InstanceResource
                    ##
                    # Initialize the AccessTokenInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this AccessToken
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AccessTokenInstance] AccessTokenInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'entity_identity' => payload['entity_identity'],
                            'factor_type' => payload['factor_type'],
                            'factor_friendly_name' => payload['factor_friendly_name'],
                            'token' => payload['token'],
                            'url' => payload['url'],
                            'ttl' => payload['ttl'] == nil ? payload['ttl'] : payload['ttl'].to_i,
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AccessTokenContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AccessTokenContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Access Token.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Verify Service.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The unique external identifier for the Entity of the Service.
                    def entity_identity
                        @properties['entity_identity']
                    end
                    
                    ##
                    # @return [FactorTypes] 
                    def factor_type
                        @properties['factor_type']
                    end
                    
                    ##
                    # @return [String] A human readable description of this factor, up to 64 characters. For a push factor, this can be the device's name.
                    def factor_friendly_name
                        @properties['factor_friendly_name']
                    end
                    
                    ##
                    # @return [String] The access token generated for enrollment, this is an encrypted json web token.
                    def token
                        @properties['token']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] How long, in seconds, the access token is valid. Max: 5 minutes
                    def ttl
                        @properties['ttl']
                    end
                    
                    ##
                    # @return [Time] The date that this access token was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # Fetch the AccessTokenInstance
                    # @return [AccessTokenInstance] Fetched AccessTokenInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.AccessTokenInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.AccessTokenInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end



##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Frontline
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FrontlineApi < FrontlineApiBase
            class V1 < Version
                class UserList < ListResource
                
                    ##
                    # Initialize the UserList
                    # @param [Version] version Version that contains the resource
                    # @return [UserList] UserList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FrontlineApi.V1.UserList>'
                    end
                end


                class UserContext < InstanceContext
                    ##
                    # Initialize the UserContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the User resource to update. This value can be either the `sid` or the `identity` of the User resource to update.
                    # @return [UserContext] UserContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Users/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the UserInstance
                    # @return [UserInstance] Fetched UserInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        UserInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the UserInstance
                    # @param [String] friendly_name The string that you assigned to describe the User.
                    # @param [String] avatar The avatar URL which will be shown in Frontline application.
                    # @param [StateType] state 
                    # @param [Boolean] is_available Whether the User is available for new conversations. Set to `false` to prevent User from receiving new inbound conversations if you are using [Pool Routing](https://www.twilio.com/docs/frontline/handle-incoming-conversations#3-pool-routing).
                    # @return [UserInstance] Updated UserInstance
                    def update(
                        friendly_name: :unset, 
                        avatar: :unset, 
                        state: :unset, 
                        is_available: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Avatar' => avatar,
                            'State' => state,
                            'IsAvailable' => is_available,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        UserInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FrontlineApi.V1.UserContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FrontlineApi.V1.UserContext #{context}>"
                    end
                end

                class UserPage < Page
                    ##
                    # Initialize the UserPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UserPage] UserPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UserInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UserInstance] UserInstance
                    def get_instance(payload)
                        UserInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FrontlineApi.V1.UserPage>'
                    end
                end
                class UserInstance < InstanceResource
                    ##
                    # Initialize the UserInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this User
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UserInstance] UserInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'identity' => payload['identity'],
                            'friendly_name' => payload['friendly_name'],
                            'avatar' => payload['avatar'],
                            'state' => payload['state'],
                            'is_available' => payload['is_available'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [UserContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = UserContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the User resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The application-defined string that uniquely identifies the resource's User. This value is often a username or an email address, and is case-sensitive.
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the User.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The avatar URL which will be shown in Frontline application.
                    def avatar
                        @properties['avatar']
                    end
                    
                    ##
                    # @return [StateType] 
                    def state
                        @properties['state']
                    end
                    
                    ##
                    # @return [Boolean] Whether the User is available for new conversations. Defaults to `false` for new users.
                    def is_available
                        @properties['is_available']
                    end
                    
                    ##
                    # @return [String] An absolute API resource URL for this user.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the UserInstance
                    # @return [UserInstance] Fetched UserInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the UserInstance
                    # @param [String] friendly_name The string that you assigned to describe the User.
                    # @param [String] avatar The avatar URL which will be shown in Frontline application.
                    # @param [StateType] state 
                    # @param [Boolean] is_available Whether the User is available for new conversations. Set to `false` to prevent User from receiving new inbound conversations if you are using [Pool Routing](https://www.twilio.com/docs/frontline/handle-incoming-conversations#3-pool-routing).
                    # @return [UserInstance] Updated UserInstance
                    def update(
                        friendly_name: :unset, 
                        avatar: :unset, 
                        state: :unset, 
                        is_available: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            avatar: avatar, 
                            state: state, 
                            is_available: is_available, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FrontlineApi.V1.UserInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FrontlineApi.V1.UserInstance #{values}>"
                    end
                end

            end
        end
    end
end

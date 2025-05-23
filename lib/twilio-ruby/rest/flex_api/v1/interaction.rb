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
                class InteractionList < ListResource
                
                    ##
                    # Initialize the InteractionList
                    # @param [Version] version Version that contains the resource
                    # @return [InteractionList] InteractionList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Interactions"
                        
                    end
                    ##
                    # Create the InteractionInstance
                    # @param [Object] channel The Interaction's channel.
                    # @param [Object] routing The Interaction's routing logic.
                    # @param [String] interaction_context_sid The Interaction context sid is used for adding a context lookup sid
                    # @param [String] webhook_ttid The unique identifier for Interaction level webhook
                    # @return [InteractionInstance] Created InteractionInstance
                    def create(
                        channel: nil, 
                        routing: :unset, 
                        interaction_context_sid: :unset, 
                        webhook_ttid: :unset
                    )

                        data = Twilio::Values.of({
                            'Channel' => Twilio.serialize_object(channel),
                            'Routing' => Twilio.serialize_object(routing),
                            'InteractionContextSid' => interaction_context_sid,
                            'WebhookTtid' => webhook_ttid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        InteractionInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InteractionList>'
                    end
                end


                class InteractionContext < InstanceContext
                    ##
                    # Initialize the InteractionContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Interaction resource to fetch.
                    # @return [InteractionContext] InteractionContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Interactions/#{@solution[:sid]}"

                        # Dependents
                        @channels = nil
                    end
                    ##
                    # Fetch the InteractionInstance
                    # @return [InteractionInstance] Fetched InteractionInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        InteractionInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the InteractionInstance
                    # @param [String] webhook_ttid The unique identifier for Interaction level webhook
                    # @return [InteractionInstance] Updated InteractionInstance
                    def update(
                        webhook_ttid: :unset
                    )

                        data = Twilio::Values.of({
                            'WebhookTtid' => webhook_ttid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        InteractionInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the channels
                    # @return [InteractionChannelList]
                    # @return [InteractionChannelContext] if sid was passed.
                    def channels(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return InteractionChannelContext.new(@version, @solution[:sid],sid )
                        end

                        unless @channels
                            @channels = InteractionChannelList.new(
                                @version, interaction_sid: @solution[:sid], )
                        end

                     @channels
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InteractionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InteractionContext #{context}>"
                    end
                end

                class InteractionPage < Page
                    ##
                    # Initialize the InteractionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InteractionPage] InteractionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InteractionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InteractionInstance] InteractionInstance
                    def get_instance(payload)
                        InteractionInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InteractionPage>'
                    end
                end
                class InteractionInstance < InstanceResource
                    ##
                    # Initialize the InteractionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Interaction
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InteractionInstance] InteractionInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'channel' => payload['channel'],
                            'routing' => payload['routing'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                            'interaction_context_sid' => payload['interaction_context_sid'],
                            'webhook_ttid' => payload['webhook_ttid'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [InteractionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = InteractionContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string created by Twilio to identify an Interaction resource, prefixed with KD.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [Hash] A JSON object that defines the Interaction’s communication channel and includes details about the channel. See the [Outbound SMS](https://www.twilio.com/docs/flex/developer/conversations/interactions-api/interactions#agent-initiated-outbound-interactions) and [inbound (API-initiated)](https://www.twilio.com/docs/flex/developer/conversations/interactions-api/interactions#api-initiated-contact) Channel object examples.
                    def channel
                        @properties['channel']
                    end
                    
                    ##
                    # @return [Hash] A JSON Object representing the routing rules for the Interaction Channel. See [Outbound SMS Example](https://www.twilio.com/docs/flex/developer/conversations/interactions-api/interactions#agent-initiated-outbound-interactions) for an example Routing object. The Interactions resource uses TaskRouter for all routing functionality.   All attributes in the Routing object on your Interaction request body are added “as is” to the task. For a list of known attributes consumed by the Flex UI and/or Flex Insights, see [Known Task Attributes](https://www.twilio.com/docs/flex/developer/conversations/interactions-api#task-attributes).
                    def routing
                        @properties['routing']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [String] 
                    def interaction_context_sid
                        @properties['interaction_context_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def webhook_ttid
                        @properties['webhook_ttid']
                    end
                    
                    ##
                    # Fetch the InteractionInstance
                    # @return [InteractionInstance] Fetched InteractionInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the InteractionInstance
                    # @param [String] webhook_ttid The unique identifier for Interaction level webhook
                    # @return [InteractionInstance] Updated InteractionInstance
                    def update(
                        webhook_ttid: :unset
                    )

                        context.update(
                            webhook_ttid: webhook_ttid, 
                        )
                    end

                    ##
                    # Access the channels
                    # @return [channels] channels
                    def channels
                        context.channels
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InteractionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InteractionInstance #{values}>"
                    end
                end

            end
        end
    end
end

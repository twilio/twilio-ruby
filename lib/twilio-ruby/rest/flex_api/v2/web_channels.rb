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
            class V2 < Version
                class WebChannelsList < ListResource
                    ##
                    # Initialize the WebChannelsList
                    # @param [Version] version Version that contains the resource
                    # @return [WebChannelsList] WebChannelsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/WebChats"
                        
                    end
                    ##
                    # Create the WebChannelsInstance
                    # @param [String] address_sid The SID of the Conversations Address. See [Address Configuration Resource](https://www.twilio.com/docs/conversations/api/address-configuration-resource) for configuration details. When a conversation is created on the Flex backend, the callback URL will be set to the corresponding Studio Flow SID or webhook URL in your address configuration.
                    # @param [String] chat_friendly_name The Conversation's friendly name. See the [Conversation resource](https://www.twilio.com/docs/conversations/api/conversation-resource) for an example.
                    # @param [String] customer_friendly_name The Conversation participant's friendly name. See the [Conversation Participant Resource](https://www.twilio.com/docs/conversations/api/conversation-participant-resource) for an example.
                    # @param [String] pre_engagement_data The pre-engagement data.
                    # @return [WebChannelsInstance] Created WebChannelsInstance
                    def create(
                        address_sid: nil, 
                        chat_friendly_name: :unset, 
                        customer_friendly_name: :unset, 
                        pre_engagement_data: :unset
                    )

                        data = Twilio::Values.of({
                            'AddressSid' => address_sid,
                            'ChatFriendlyName' => chat_friendly_name,
                            'CustomerFriendlyName' => customer_friendly_name,
                            'PreEngagementData' => pre_engagement_data,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        WebChannelsInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V2.WebChannelsList>'
                    end
                end
                class WebChannelsPage < Page
                    ##
                    # Initialize the WebChannelsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [WebChannelsPage] WebChannelsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of WebChannelsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [WebChannelsInstance] WebChannelsInstance
                    def get_instance(payload)
                        WebChannelsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V2.WebChannelsPage>'
                    end
                end
                class WebChannelsInstance < InstanceResource
                    ##
                    # Initialize the WebChannelsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this WebChannels
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [WebChannelsInstance] WebChannelsInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'conversation_sid' => payload['conversation_sid'],
                            'identity' => payload['identity'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique string representing the [Conversation resource](https://www.twilio.com/docs/conversations/api/conversation-resource) created.
                    def conversation_sid
                        @properties['conversation_sid']
                    end
                    
                    ##
                    # @return [String] The unique string representing the User created and should be authorized to participate in the Conversation. For more details, see [User Identity & Access Tokens](https://www.twilio.com/docs/conversations/identity).
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.FlexApi.V2.WebChannelsInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.FlexApi.V2.WebChannelsInstance>"
                    end
                end
            end
        end
    end
end

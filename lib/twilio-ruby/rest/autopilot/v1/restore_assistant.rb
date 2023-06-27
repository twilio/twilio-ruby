##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Autopilot
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Autopilot < AutopilotBase
            class V1 < Version
                class RestoreAssistantList < ListResource
                    ##
                    # Initialize the RestoreAssistantList
                    # @param [Version] version Version that contains the resource
                    # @return [RestoreAssistantList] RestoreAssistantList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Assistants/Restore"
                        
                    end
                    ##
                    # Update the RestoreAssistantInstance
                    # @param [String] assistant The Twilio-provided string that uniquely identifies the Assistant resource to restore.
                    # @return [RestoreAssistantInstance] Updated RestoreAssistantInstance
                    def update(
                        assistant: nil
                    )

                        data = Twilio::Values.of({
                            'Assistant' => assistant,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        RestoreAssistantInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Autopilot.V1.RestoreAssistantList>'
                    end
                end

                class RestoreAssistantPage < Page
                    ##
                    # Initialize the RestoreAssistantPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [RestoreAssistantPage] RestoreAssistantPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of RestoreAssistantInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [RestoreAssistantInstance] RestoreAssistantInstance
                    def get_instance(payload)
                        RestoreAssistantInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Autopilot.V1.RestoreAssistantPage>'
                    end
                end
                class RestoreAssistantInstance < InstanceResource
                    ##
                    # Initialize the RestoreAssistantInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this RestoreAssistant
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [RestoreAssistantInstance] RestoreAssistantInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'sid' => payload['sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'unique_name' => payload['unique_name'],
                            'friendly_name' => payload['friendly_name'],
                            'needs_model_build' => payload['needs_model_build'],
                            'latest_model_build_sid' => payload['latest_model_build_sid'],
                            'log_queries' => payload['log_queries'],
                            'development_stage' => payload['development_stage'],
                            'callback_url' => payload['callback_url'],
                            'callback_events' => payload['callback_events'],
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Assistant resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Assistant resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource. It is not unique and can be up to 255 characters long.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Boolean] Whether model needs to be rebuilt.
                    def needs_model_build
                        @properties['needs_model_build']
                    end
                    
                    ##
                    # @return [String] Reserved.
                    def latest_model_build_sid
                        @properties['latest_model_build_sid']
                    end
                    
                    ##
                    # @return [Boolean] Whether queries should be logged and kept after training. Can be: `true` or `false` and defaults to `true`. If `true`, queries are stored for 30 days, and then deleted. If `false`, no queries are stored.
                    def log_queries
                        @properties['log_queries']
                    end
                    
                    ##
                    # @return [String] A string describing the state of the assistant.
                    def development_stage
                        @properties['development_stage']
                    end
                    
                    ##
                    # @return [String] Reserved.
                    def callback_url
                        @properties['callback_url']
                    end
                    
                    ##
                    # @return [String] Reserved.
                    def callback_events
                        @properties['callback_events']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Autopilot.V1.RestoreAssistantInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Autopilot.V1.RestoreAssistantInstance>"
                    end
                end

            end
        end
    end
end

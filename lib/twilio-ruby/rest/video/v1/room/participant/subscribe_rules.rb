##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Video
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Video < VideoBase
            class V1 < Version
                class RoomContext < InstanceContext
                class ParticipantContext < InstanceContext

                     class SubscribeRulesList < ListResource
                    ##
                    # Initialize the SubscribeRulesList
                    # @param [Version] version Version that contains the resource
                    # @return [SubscribeRulesList] SubscribeRulesList
                    def initialize(version, room_sid: nil, participant_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { room_sid: room_sid, participant_sid: participant_sid }
                        @uri = "/Rooms/#{@solution[:room_sid]}/Participants/#{@solution[:participant_sid]}/SubscribeRules"
                        
                    end
                    ##
                    # Fetch the SubscribeRulesInstance
                    # @return [SubscribeRulesInstance] Fetched SubscribeRulesInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        SubscribeRulesInstance.new(
                            @version,
                            payload,
                            room_sid: @solution[:room_sid],
                            participant_sid: @solution[:participant_sid],
                        )
                    end

                    ##
                    # Update the SubscribeRulesInstance
                    # @param [Object] rules A JSON-encoded array of subscribe rules. See the [Specifying Subscribe Rules](https://www.twilio.com/docs/video/api/track-subscriptions#specifying-sr) section for further information.
                    # @return [SubscribeRulesInstance] Updated SubscribeRulesInstance
                    def update(
                        rules: :unset
                    )

                        data = Twilio::Values.of({
                            'Rules' => Twilio.serialize_object(rules),
                        })

                        payload = @version.update('POST', @uri, data: data)
                        SubscribeRulesInstance.new(
                            @version,
                            payload,
                            room_sid: @solution[:room_sid],
                            participant_sid: @solution[:participant_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Video.V1.SubscribeRulesList>'
                    end
                end

                class SubscribeRulesPage < Page
                    ##
                    # Initialize the SubscribeRulesPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SubscribeRulesPage] SubscribeRulesPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SubscribeRulesInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SubscribeRulesInstance] SubscribeRulesInstance
                    def get_instance(payload)
                        SubscribeRulesInstance.new(@version, payload, room_sid: @solution[:room_sid], participant_sid: @solution[:participant_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Video.V1.SubscribeRulesPage>'
                    end
                end
                class SubscribeRulesInstance < InstanceResource
                    ##
                    # Initialize the SubscribeRulesInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SubscribeRules
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SubscribeRulesInstance] SubscribeRulesInstance
                    def initialize(version, payload , room_sid: nil, participant_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'participant_sid' => payload['participant_sid'],
                            'room_sid' => payload['room_sid'],
                            'rules' => payload['rules'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the Participant resource for the Subscribe Rules.
                    def participant_sid
                        @properties['participant_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Room resource for the Subscribe Rules
                    def room_sid
                        @properties['room_sid']
                    end
                    
                    ##
                    # @return [Array<VideoV1RoomRoomParticipantRoomParticipantSubscribeRuleRules>] A collection of Subscribe Rules that describe how to include or exclude matching tracks. See the [Specifying Subscribe Rules](https://www.twilio.com/docs/video/api/track-subscriptions#specifying-sr) section for further information.
                    def rules
                        @properties['rules']
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
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Video.V1.SubscribeRulesInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Video.V1.SubscribeRulesInstance>"
                    end
                end

             end
             end
            end
        end
    end
end



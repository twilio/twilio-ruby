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
                class InteractionContext < InstanceContext
                class InteractionChannelContext < InstanceContext

                     class InteractionChannelParticipantList < ListResource
                    ##
                    # Initialize the InteractionChannelParticipantList
                    # @param [Version] version Version that contains the resource
                    # @return [InteractionChannelParticipantList] InteractionChannelParticipantList
                    def initialize(version, interaction_sid: nil, channel_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { interaction_sid: interaction_sid,channel_sid: channel_sid, }
                        @uri = "/Interactions/#{@solution[:interaction_sid]}/Channels/#{@solution[:channel_sid]}/Participants"
                        
                    end
                    ##
                    # Create the InteractionChannelParticipantInstance
                    # @param [InteractionChannelParticipantType] type 
                    # @param [Object] media_properties JSON representing the Media Properties for the new Participant.
                    # @return [InteractionChannelParticipantInstance] Created InteractionChannelParticipantInstance
                    def create(
                        type: nil, 
                        media_properties: nil
                    )

                        data = Twilio::Values.of({
                            'Type' => type,
                            'MediaProperties' => Twilio.serialize_object(media_properties),
                        })

                        payload = @version.create('POST', @uri, data: data)
                        InteractionChannelParticipantInstance.new(
                            @version,
                            payload,
                            interaction_sid: @solution[:interaction_sid],
                            channel_sid: @solution[:channel_sid],
                        )
                    end

                
                    ##
                    # Lists InteractionChannelParticipantInstance records from the API as a list.
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
                    # When passed a block, yields InteractionChannelParticipantInstance records from the API.
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
                    # Retrieve a single page of InteractionChannelParticipantInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of InteractionChannelParticipantInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        InteractionChannelParticipantPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of InteractionChannelParticipantInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of InteractionChannelParticipantInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    InteractionChannelParticipantPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InteractionChannelParticipantList>'
                    end
                end

                class InteractionChannelParticipantContext < InstanceContext
                    ##
                    # Initialize the InteractionChannelParticipantContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] interaction_sid The Interaction Sid for this channel.
                    # @param [String] channel_sid The Channel Sid for this Participant.
                    # @param [String] sid The unique string created by Twilio to identify an Interaction Channel resource.
                    # @return [InteractionChannelParticipantContext] InteractionChannelParticipantContext
                    def initialize(version, interaction_sid, channel_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { interaction_sid: interaction_sid, channel_sid: channel_sid, sid: sid,  }
                        @uri = "/Interactions/#{@solution[:interaction_sid]}/Channels/#{@solution[:channel_sid]}/Participants/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Update the InteractionChannelParticipantInstance
                    # @param [InteractionChannelParticipantStatus] status 
                    # @return [InteractionChannelParticipantInstance] Updated InteractionChannelParticipantInstance
                    def update(
                        status: nil
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        InteractionChannelParticipantInstance.new(
                            @version,
                            payload,
                            interaction_sid: @solution[:interaction_sid],
                            channel_sid: @solution[:channel_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InteractionChannelParticipantContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InteractionChannelParticipantContext #{context}>"
                    end
                end

                class InteractionChannelParticipantPage < Page
                    ##
                    # Initialize the InteractionChannelParticipantPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InteractionChannelParticipantPage] InteractionChannelParticipantPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InteractionChannelParticipantInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InteractionChannelParticipantInstance] InteractionChannelParticipantInstance
                    def get_instance(payload)
                        InteractionChannelParticipantInstance.new(@version, payload, interaction_sid: @solution[:interaction_sid], channel_sid: @solution[:channel_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InteractionChannelParticipantPage>'
                    end
                end
                class InteractionChannelParticipantInstance < InstanceResource
                    ##
                    # Initialize the InteractionChannelParticipantInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InteractionChannelParticipant
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InteractionChannelParticipantInstance] InteractionChannelParticipantInstance
                    def initialize(version, payload , interaction_sid: nil, channel_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'type' => payload['type'],
                            'interaction_sid' => payload['interaction_sid'],
                            'channel_sid' => payload['channel_sid'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'interaction_sid' => interaction_sid  || @properties['interaction_sid']  ,'channel_sid' => channel_sid  || @properties['channel_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [InteractionChannelParticipantContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = InteractionChannelParticipantContext.new(@version , @params['interaction_sid'], @params['channel_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string created by Twilio to identify an Interaction Channel Participant resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [InteractionChannelParticipantType] 
                    def type
                        @properties['type']
                    end
                    
                    ##
                    # @return [String] The Interaction Sid for this channel.
                    def interaction_sid
                        @properties['interaction_sid']
                    end
                    
                    ##
                    # @return [String] The Channel Sid for this Participant.
                    def channel_sid
                        @properties['channel_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Update the InteractionChannelParticipantInstance
                    # @param [InteractionChannelParticipantStatus] status 
                    # @return [InteractionChannelParticipantInstance] Updated InteractionChannelParticipantInstance
                    def update(
                        status: nil
                    )

                        context.update(
                            status: status, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InteractionChannelParticipantInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InteractionChannelParticipantInstance #{values}>"
                    end
                end
             end
             end
            end
        end
    end
end



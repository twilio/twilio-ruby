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

                     class InteractionTransferList < ListResource
                
                    ##
                    # Initialize the InteractionTransferList
                    # @param [Version] version Version that contains the resource
                    # @return [InteractionTransferList] InteractionTransferList
                    def initialize(version, interaction_sid: nil, channel_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { interaction_sid: interaction_sid, channel_sid: channel_sid }
                        @uri = "/Interactions/#{@solution[:interaction_sid]}/Channels/#{@solution[:channel_sid]}/Transfers"
                        
                    end
                    ##
                    # Create the InteractionTransferInstance
                    # @param [Object] body 
                    # @return [InteractionTransferInstance] Created InteractionTransferInstance
                    def create(body: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        headers['Content-Type'] = 'application/json'
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, headers: headers, data: body.to_json)
                        InteractionTransferInstance.new(
                            @version,
                            payload,
                            interaction_sid: @solution[:interaction_sid],
                            channel_sid: @solution[:channel_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InteractionTransferList>'
                    end
                end


                class InteractionTransferContext < InstanceContext
                    ##
                    # Initialize the InteractionTransferContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] interaction_sid The Interaction Sid for this channel.
                    # @param [String] channel_sid The Channel Sid for this Transfer.
                    # @param [String] sid The unique string created by Twilio to identify a Transfer resource.
                    # @return [InteractionTransferContext] InteractionTransferContext
                    def initialize(version, interaction_sid, channel_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { interaction_sid: interaction_sid, channel_sid: channel_sid, sid: sid,  }
                        @uri = "/Interactions/#{@solution[:interaction_sid]}/Channels/#{@solution[:channel_sid]}/Transfers/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the InteractionTransferInstance
                    # @return [InteractionTransferInstance] Fetched InteractionTransferInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        InteractionTransferInstance.new(
                            @version,
                            payload,
                            interaction_sid: @solution[:interaction_sid],
                            channel_sid: @solution[:channel_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the InteractionTransferInstance
                    # @param [Object] body 
                    # @return [InteractionTransferInstance] Updated InteractionTransferInstance
                    def update(body: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        headers['Content-Type'] = 'application/json'
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, headers: headers, data: body.to_json)
                        InteractionTransferInstance.new(
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
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InteractionTransferContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InteractionTransferContext #{context}>"
                    end
                end

                class InteractionTransferPage < Page
                    ##
                    # Initialize the InteractionTransferPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InteractionTransferPage] InteractionTransferPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InteractionTransferInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InteractionTransferInstance] InteractionTransferInstance
                    def get_instance(payload)
                        InteractionTransferInstance.new(@version, payload, interaction_sid: @solution[:interaction_sid], channel_sid: @solution[:channel_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InteractionTransferPage>'
                    end
                end
                class InteractionTransferInstance < InstanceResource
                    ##
                    # Initialize the InteractionTransferInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InteractionTransfer
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InteractionTransferInstance] InteractionTransferInstance
                    def initialize(version, payload , interaction_sid: nil, channel_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'instance_sid' => payload['instance_sid'],
                            'account_sid' => payload['account_sid'],
                            'interaction_sid' => payload['interaction_sid'],
                            'channel_sid' => payload['channel_sid'],
                            'execution_sid' => payload['execution_sid'],
                            'type' => payload['type'],
                            'status' => payload['status'],
                            'from' => payload['from'],
                            'to' => payload['to'],
                            'note_sid' => payload['note_sid'],
                            'summary_sid' => payload['summary_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'interaction_sid' => interaction_sid  || @properties['interaction_sid']  ,'channel_sid' => channel_sid  || @properties['channel_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [InteractionTransferContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = InteractionTransferContext.new(@version , @params['interaction_sid'], @params['channel_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string created by Twilio to identify an Interaction Transfer resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Instance associated with the Transfer.
                    def instance_sid
                        @properties['instance_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Account that created the Transfer.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The Interaction Sid for this channel.
                    def interaction_sid
                        @properties['interaction_sid']
                    end
                    
                    ##
                    # @return [String] The Channel Sid for this Transfer.
                    def channel_sid
                        @properties['channel_sid']
                    end
                    
                    ##
                    # @return [String] The Execution SID associated with the Transfer.
                    def execution_sid
                        @properties['execution_sid']
                    end
                    
                    ##
                    # @return [TransferType] 
                    def type
                        @properties['type']
                    end
                    
                    ##
                    # @return [TransferStatus] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The SID of the Participant initiating the Transfer.
                    def from
                        @properties['from']
                    end
                    
                    ##
                    # @return [String] The SID of the Participant receiving the Transfer.
                    def to
                        @properties['to']
                    end
                    
                    ##
                    # @return [String] The SID of the Note associated with the Transfer.
                    def note_sid
                        @properties['note_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Summary associated with the Transfer.
                    def summary_sid
                        @properties['summary_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time when the Transfer was created.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time when the Transfer was last updated.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the InteractionTransferInstance
                    # @return [InteractionTransferInstance] Fetched InteractionTransferInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the InteractionTransferInstance
                    # @param [Object] body 
                    # @return [InteractionTransferInstance] Updated InteractionTransferInstance
                    def update(body: :unset
                    )

                        context.update(
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InteractionTransferInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InteractionTransferInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end



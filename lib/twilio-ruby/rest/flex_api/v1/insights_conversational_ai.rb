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
                class InsightsConversationalAiList < ListResource
                
                    ##
                    # Initialize the InsightsConversationalAiList
                    # @param [Version] version Version that contains the resource
                    # @return [InsightsConversationalAiList] InsightsConversationalAiList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InsightsConversationalAiList>'
                    end
                end


                class InsightsConversationalAiContext < InstanceContext
                    ##
                    # Initialize the InsightsConversationalAiContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] instance_sid Sid of Flex Service Instance
                    # @return [InsightsConversationalAiContext] InsightsConversationalAiContext
                    def initialize(version, instance_sid)
                        super(version)

                        # Path Solution
                        @solution = { instance_sid: instance_sid,  }
                        @uri = "/Insights/Instances/#{@solution[:instance_sid]}/AI/Reports"

                        
                    end
                    ##
                    # Fetch the InsightsConversationalAiInstance
                    # @param [String] max_rows Maximum number of rows to return
                    # @param [String] report_id The type of report required to fetch.Like gauge,channel-metrics,queue-metrics
                    # @param [Granularity] granularity The time period for which report is needed
                    # @param [Time] include_date A reference date that should be included in the returned period
                    # @return [InsightsConversationalAiInstance] Fetched InsightsConversationalAiInstance
                    def fetch(
                        max_rows: :unset, 
                        report_id: :unset, 
                        granularity: :unset, 
                        include_date: :unset
                    )

                        params = Twilio::Values.of({
                            'MaxRows' => max_rows,
                            'ReportId' => report_id,
                            'Granularity' => granularity,
                            'IncludeDate' => Twilio.serialize_iso8601_datetime(include_date),
                        })
                        
                        payload = @version.fetch('GET', @uri, params: params)
                        InsightsConversationalAiInstance.new(
                            @version,
                            payload,
                            instance_sid: @solution[:instance_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InsightsConversationalAiContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InsightsConversationalAiContext #{context}>"
                    end
                end

                class InsightsConversationalAiPage < Page
                    ##
                    # Initialize the InsightsConversationalAiPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InsightsConversationalAiPage] InsightsConversationalAiPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InsightsConversationalAiInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InsightsConversationalAiInstance] InsightsConversationalAiInstance
                    def get_instance(payload)
                        InsightsConversationalAiInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InsightsConversationalAiPage>'
                    end
                end
                class InsightsConversationalAiInstance < InstanceResource
                    ##
                    # Initialize the InsightsConversationalAiInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InsightsConversationalAi
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InsightsConversationalAiInstance] InsightsConversationalAiInstance
                    def initialize(version, payload , instance_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'instance_sid' => payload['instance_sid'],
                            'report_id' => payload['report_id'],
                            'granularity' => payload['granularity'],
                            'period_start' => Twilio.deserialize_iso8601_datetime(payload['period_start']),
                            'period_end' => Twilio.deserialize_iso8601_datetime(payload['period_end']),
                            'updated' => Twilio.deserialize_iso8601_datetime(payload['updated']),
                            'total_pages' => payload['total_pages'] == nil ? payload['total_pages'] : payload['total_pages'].to_i,
                            'page' => payload['page'] == nil ? payload['page'] : payload['page'].to_i,
                            'rows' => payload['rows'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'instance_sid' => instance_sid  || @properties['instance_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [InsightsConversationalAiContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = InsightsConversationalAiContext.new(@version , @params['instance_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] Sid of Flex Service Instance
                    def instance_sid
                        @properties['instance_sid']
                    end
                    
                    ##
                    # @return [String] The type of report required to fetch.Like gauge,channel-metrics,queue-metrics
                    def report_id
                        @properties['report_id']
                    end
                    
                    ##
                    # @return [Granularity] 
                    def granularity
                        @properties['granularity']
                    end
                    
                    ##
                    # @return [Time] The start date from which report data is included
                    def period_start
                        @properties['period_start']
                    end
                    
                    ##
                    # @return [Time] The end date till report data is included
                    def period_end
                        @properties['period_end']
                    end
                    
                    ##
                    # @return [Time] Updated time of the report
                    def updated
                        @properties['updated']
                    end
                    
                    ##
                    # @return [String] Represents total number of pages fetched report has
                    def total_pages
                        @properties['total_pages']
                    end
                    
                    ##
                    # @return [String] Page offset required for pagination
                    def page
                        @properties['page']
                    end
                    
                    ##
                    # @return [Array<Hash>] List of report breakdown 
                    def rows
                        @properties['rows']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the InsightsConversationalAiInstance
                    # @param [String] max_rows Maximum number of rows to return
                    # @param [String] report_id The type of report required to fetch.Like gauge,channel-metrics,queue-metrics
                    # @param [Granularity] granularity The time period for which report is needed
                    # @param [Time] include_date A reference date that should be included in the returned period
                    # @return [InsightsConversationalAiInstance] Fetched InsightsConversationalAiInstance
                    def fetch(
                        max_rows: :unset, 
                        report_id: :unset, 
                        granularity: :unset, 
                        include_date: :unset
                    )

                        context.fetch(
                            max_rows: max_rows, 
                            report_id: report_id, 
                            granularity: granularity, 
                            include_date: include_date, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InsightsConversationalAiInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InsightsConversationalAiInstance #{values}>"
                    end
                end

            end
        end
    end
end
##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Events
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Events < EventsBase
            class V1 < Version
                class SinkContext < InstanceContext

                     class SinkTestList < ListResource
                
                    ##
                    # Initialize the SinkTestList
                    # @param [Version] version Version that contains the resource
                    # @return [SinkTestList] SinkTestList
                    def initialize(version, sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { sid: sid }
                        @uri = "/Sinks/#{@solution[:sid]}/Test"
                        
                    end
                    ##
                    # Create the SinkTestInstance
                    # @return [SinkTestInstance] Created SinkTestInstance
                    def create

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, headers: headers)
                        SinkTestInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Events.V1.SinkTestList>'
                    end
                end

                class SinkTestPage < Page
                    ##
                    # Initialize the SinkTestPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SinkTestPage] SinkTestPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SinkTestInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SinkTestInstance] SinkTestInstance
                    def get_instance(payload)
                        SinkTestInstance.new(@version, payload, sid: @solution[:sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Events.V1.SinkTestPage>'
                    end
                end
                class SinkTestInstance < InstanceResource
                    ##
                    # Initialize the SinkTestInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SinkTest
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SinkTestInstance] SinkTestInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'result' => payload['result'],
                        }
                    end

                    
                    ##
                    # @return [String] Feedback indicating whether the test event was generated.
                    def result
                        @properties['result']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Events.V1.SinkTestInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Events.V1.SinkTestInstance>"
                    end
                end

             end
            end
        end
    end
end



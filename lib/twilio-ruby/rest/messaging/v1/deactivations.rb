##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Messaging
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Messaging < MessagingBase
            class V1 < Version
                class DeactivationsList < ListResource
                    ##
                    # Initialize the DeactivationsList
                    # @param [Version] version Version that contains the resource
                    # @return [DeactivationsList] DeactivationsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Messaging.V1.DeactivationsList>'
                    end
                end

                class DeactivationsContext < InstanceContext
                    ##
                    # Initialize the DeactivationsContext
                    # @param [Version] version Version that contains the resource
                    # @return [DeactivationsContext] DeactivationsContext
                    def initialize(version)
                        super(version)

                        # Path Solution
                        @solution = {  }
                        @uri = "/Deactivations"

                        
                    end
                    ##
                    # Fetch the DeactivationsInstance
                    # @param [Date] date The request will return a list of all United States Phone Numbers that were deactivated on the day specified by this parameter. This date should be specified in YYYY-MM-DD format.
                    # @return [DeactivationsInstance] Fetched DeactivationsInstance
                    def fetch(
                        date: :unset
                    )

                        params = Twilio::Values.of({
                            'Date' => Twilio.serialize_iso8601_date(date),
                        })
                        payload = @version.fetch('GET', @uri, params: params)
                        DeactivationsInstance.new(
                            @version,
                            payload,
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Messaging.V1.DeactivationsContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Messaging.V1.DeactivationsContext #{context}>"
                    end
                end

                class DeactivationsPage < Page
                    ##
                    # Initialize the DeactivationsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [DeactivationsPage] DeactivationsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of DeactivationsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [DeactivationsInstance] DeactivationsInstance
                    def get_instance(payload)
                        DeactivationsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Messaging.V1.DeactivationsPage>'
                    end
                end
                class DeactivationsInstance < InstanceResource
                    ##
                    # Initialize the DeactivationsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Deactivations
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [DeactivationsInstance] DeactivationsInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'redirect_to' => payload['redirect_to'],
                        }

                        # Context
                        @instance_context = nil
                        @params = {  }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [DeactivationsContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = DeactivationsContext.new(@version )
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] Returns an authenticated url that redirects to a file containing the deactivated numbers for the requested day. This url is valid for up to two minutes.
                    def redirect_to
                        @properties['redirect_to']
                    end
                    
                    ##
                    # Fetch the DeactivationsInstance
                    # @param [Date] date The request will return a list of all United States Phone Numbers that were deactivated on the day specified by this parameter. This date should be specified in YYYY-MM-DD format.
                    # @return [DeactivationsInstance] Fetched DeactivationsInstance
                    def fetch(
                        date: :unset
                    )

                        context.fetch(
                            date: date, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Messaging.V1.DeactivationsInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Messaging.V1.DeactivationsInstance #{values}>"
                    end
                end
            end
        end
    end
end

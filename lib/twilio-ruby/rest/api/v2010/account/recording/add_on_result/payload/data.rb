##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Api
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Api < ApiBase
            class V2010 < Version
                class AccountContext < InstanceContext
                class RecordingContext < InstanceContext
                class AddOnResultContext < InstanceContext
                class PayloadContext < InstanceContext

                     class DataList < ListResource
                
                    ##
                    # Initialize the DataList
                    # @param [Version] version Version that contains the resource
                    # @return [DataList] DataList
                    def initialize(version, account_sid: nil, reference_sid: nil, add_on_result_sid: nil, payload_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid, reference_sid: reference_sid, add_on_result_sid: add_on_result_sid, payload_sid: payload_sid }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.DataList>'
                    end
                end


                class DataContext < InstanceContext
                    ##
                    # Initialize the DataContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording AddOnResult Payload resource to fetch.
                    # @param [String] reference_sid The SID of the recording to which the AddOnResult resource that contains the payload to fetch belongs.
                    # @param [String] add_on_result_sid The SID of the AddOnResult to which the payload to fetch belongs.
                    # @param [String] payload_sid The Twilio-provided string that uniquely identifies the Recording AddOnResult Payload resource to fetch.
                    # @return [DataContext] DataContext
                    def initialize(version, account_sid, reference_sid, add_on_result_sid, payload_sid)
                        super(version)

                        # Path Solution
                        @solution = { account_sid: account_sid, reference_sid: reference_sid, add_on_result_sid: add_on_result_sid, payload_sid: payload_sid,  }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:reference_sid]}/AddOnResults/#{@solution[:add_on_result_sid]}/Payloads/#{@solution[:payload_sid]}/Data.json"

                        
                    end
                    ##
                    # Fetch the DataInstance
                    # @return [DataInstance] Fetched DataInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        DataInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            reference_sid: @solution[:reference_sid],
                            add_on_result_sid: @solution[:add_on_result_sid],
                            payload_sid: @solution[:payload_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.DataContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.DataContext #{context}>"
                    end
                end

                class DataPage < Page
                    ##
                    # Initialize the DataPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [DataPage] DataPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of DataInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [DataInstance] DataInstance
                    def get_instance(payload)
                        DataInstance.new(@version, payload, account_sid: @solution[:account_sid], reference_sid: @solution[:reference_sid], add_on_result_sid: @solution[:add_on_result_sid], payload_sid: @solution[:payload_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.DataPage>'
                    end
                end
                class DataInstance < InstanceResource
                    ##
                    # Initialize the DataInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Data
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [DataInstance] DataInstance
                    def initialize(version, payload , account_sid: nil, reference_sid: nil, add_on_result_sid: nil, payload_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'redirect_to' => payload['redirect_to'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'account_sid' => account_sid  ,'reference_sid' => reference_sid  || @properties['reference_sid']  ,'add_on_result_sid' => add_on_result_sid  || @properties['add_on_result_sid']  ,'payload_sid' => payload_sid  || @properties['payload_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [DataContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = DataContext.new(@version , @params['account_sid'], @params['reference_sid'], @params['add_on_result_sid'], @params['payload_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The URL to redirect to to get the data returned by the AddOn that was previously stored.
                    def redirect_to
                        @properties['redirect_to']
                    end
                    
                    ##
                    # Fetch the DataInstance
                    # @return [DataInstance] Fetched DataInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.DataInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.DataInstance #{values}>"
                    end
                end

             end
             end
             end
             end
            end
        end
    end
end



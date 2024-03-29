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

                     class UsageList < ListResource
                
                    ##
                    # Initialize the UsageList
                    # @param [Version] version Version that contains the resource
                    # @return [UsageList] UsageList
                    def initialize(version, account_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Usage.json"
                        # Components
                        @records = nil
                        @triggers = nil
                    end
                

                ##
                # Access the records
                # @return [RecordList]
                # @return [RecordContext]
                def records
                    @records ||= RecordList.new(@version, account_sid: @solution[:account_sid] )
                end
                ##
                # Access the triggers
                # @return [TriggerList]
                # @return [TriggerContext] if sid was passed.
                def triggers(sid=:unset)
                    raise ArgumentError, 'sid cannot be nil' if sid.nil?

                    if sid != :unset
                        return TriggerContext.new(@version, @solution[:account_sid],sid )
                    end

                    @triggers ||= TriggerList.new(@version, account_sid: @solution[:account_sid] )
                end

                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.UsageList>'
                    end
                end

                class UsagePage < Page
                    ##
                    # Initialize the UsagePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UsagePage] UsagePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UsageInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UsageInstance] UsageInstance
                    def get_instance(payload)
                        UsageInstance.new(@version, payload, account_sid: @solution[:account_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.UsagePage>'
                    end
                end
                class UsageInstance < InstanceResource
                    ##
                    # Initialize the UsageInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Usage
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UsageInstance] UsageInstance
                    def initialize(version , account_sid: nil)
                        super(version)
                        
                    end

                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Api.V2010.UsageInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Api.V2010.UsageInstance>"
                    end
                end

             end
            end
        end
    end
end



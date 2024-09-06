##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Numbers
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Numbers < NumbersBase
            class V2 < Version
                class BundleCloneList < ListResource
                
                    ##
                    # Initialize the BundleCloneList
                    # @param [Version] version Version that contains the resource
                    # @return [BundleCloneList] BundleCloneList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Numbers.V2.BundleCloneList>'
                    end
                end


                class BundleCloneContext < InstanceContext
                    ##
                    # Initialize the BundleCloneContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] bundle_sid The unique string that identifies the Bundle to be cloned.
                    # @return [BundleCloneContext] BundleCloneContext
                    def initialize(version, bundle_sid)
                        super(version)

                        # Path Solution
                        @solution = { bundle_sid: bundle_sid,  }
                        @uri = "/RegulatoryCompliance/Bundles/#{@solution[:bundle_sid]}/Clones"

                        
                    end
                    ##
                    # Create the BundleCloneInstance
                    # @param [String] target_account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) where the bundle needs to be cloned.
                    # @param [Boolean] move_to_draft This is to determine whether the cloned bundle needs to be in draft state or not.
                    # @param [String] friendly_name The string that you assigned to describe the cloned bundle.
                    # @return [BundleCloneInstance] Created BundleCloneInstance
                    def create(
                        target_account_sid: nil, 
                        move_to_draft: :unset, 
                        friendly_name: :unset
                    )

                        data = Twilio::Values.of({
                            'TargetAccountSid' => target_account_sid,
                            'MoveToDraft' => move_to_draft,
                            'FriendlyName' => friendly_name,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        BundleCloneInstance.new(
                            @version,
                            payload,
                            bundle_sid: @solution[:bundle_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V2.BundleCloneContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V2.BundleCloneContext #{context}>"
                    end
                end

                class BundleClonePage < Page
                    ##
                    # Initialize the BundleClonePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [BundleClonePage] BundleClonePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of BundleCloneInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [BundleCloneInstance] BundleCloneInstance
                    def get_instance(payload)
                        BundleCloneInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Numbers.V2.BundleClonePage>'
                    end
                end
                class BundleCloneInstance < InstanceResource
                    ##
                    # Initialize the BundleCloneInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this BundleClone
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [BundleCloneInstance] BundleCloneInstance
                    def initialize(version, payload , bundle_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'bundle_sid' => payload['bundle_sid'],
                            'account_sid' => payload['account_sid'],
                            'regulation_sid' => payload['regulation_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'status' => payload['status'],
                            'valid_until' => Twilio.deserialize_iso8601_datetime(payload['valid_until']),
                            'email' => payload['email'],
                            'status_callback' => payload['status_callback'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'bundle_sid' => bundle_sid  || @properties['bundle_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [BundleCloneContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = BundleCloneContext.new(@version , @params['bundle_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Bundle resource.
                    def bundle_sid
                        @properties['bundle_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Bundle resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string of a regulation that is associated to the Bundle resource.
                    def regulation_sid
                        @properties['regulation_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format when the resource will be valid until.
                    def valid_until
                        @properties['valid_until']
                    end
                    
                    ##
                    # @return [String] The email address that will receive updates when the Bundle resource changes status.
                    def email
                        @properties['email']
                    end
                    
                    ##
                    # @return [String] The URL we call to inform your application of status changes.
                    def status_callback
                        @properties['status_callback']
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
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Create the BundleCloneInstance
                    # @param [String] target_account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) where the bundle needs to be cloned.
                    # @param [Boolean] move_to_draft This is to determine whether the cloned bundle needs to be in draft state or not.
                    # @param [String] friendly_name The string that you assigned to describe the cloned bundle.
                    # @return [BundleCloneInstance] Created BundleCloneInstance
                    def create(
                        target_account_sid: nil, 
                        move_to_draft: :unset, 
                        friendly_name: :unset
                    )

                        context.create(
                            target_account_sid: target_account_sid, 
                            move_to_draft: move_to_draft, 
                            friendly_name: friendly_name, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V2.BundleCloneInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V2.BundleCloneInstance #{values}>"
                    end
                end

            end
        end
    end
end

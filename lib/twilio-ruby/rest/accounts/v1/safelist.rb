##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Accounts
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Accounts < AccountsBase
            class V1 < Version
                class SafelistList < ListResource
                
                    ##
                    # Initialize the SafelistList
                    # @param [Version] version Version that contains the resource
                    # @return [SafelistList] SafelistList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/SafeList/Numbers"
                        
                    end
                    ##
                    # Create the SafelistInstance
                    # @param [String] phone_number The phone number or phone number 1k prefix to be added in SafeList. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).
                    # @return [SafelistInstance] Created SafelistInstance
                    def create(
                        phone_number: nil
                    )

                        data = Twilio::Values.of({
                            'PhoneNumber' => phone_number,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        SafelistInstance.new(
                            @version,
                            payload,
                        )
                    end

                    ##
                    # Delete the SafelistInstance
                    # @param [String] phone_number The phone number or phone number 1k prefix to be removed from SafeList. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        phone_number: :unset
                    )

                        params = Twilio::Values.of({
                            'PhoneNumber' => phone_number,
                        })
                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, params: params, headers: headers)
                    end

                    ##
                    # Fetch the SafelistInstance
                    # @param [String] phone_number The phone number or phone number 1k prefix to be fetched from SafeList. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).
                    # @return [SafelistInstance] Fetched SafelistInstance
                    def fetch(
                        phone_number: :unset
                    )

                        params = Twilio::Values.of({
                            'PhoneNumber' => phone_number,
                        })
                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, params: params, headers: headers)
                        SafelistInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Accounts.V1.SafelistList>'
                    end
                end

                class SafelistPage < Page
                    ##
                    # Initialize the SafelistPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SafelistPage] SafelistPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SafelistInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SafelistInstance] SafelistInstance
                    def get_instance(payload)
                        SafelistInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Accounts.V1.SafelistPage>'
                    end
                end
                class SafelistInstance < InstanceResource
                    ##
                    # Initialize the SafelistInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Safelist
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SafelistInstance] SafelistInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'phone_number' => payload['phone_number'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique string that we created to identify the SafeList resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The phone number or phone number 1k prefix in SafeList.
                    def phone_number
                        @properties['phone_number']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Accounts.V1.SafelistInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Accounts.V1.SafelistInstance>"
                    end
                end

            end
        end
    end
end

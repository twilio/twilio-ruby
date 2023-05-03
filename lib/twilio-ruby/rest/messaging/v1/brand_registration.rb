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
                class BrandRegistrationList < ListResource
                    ##
                    # Initialize the BrandRegistrationList
                    # @param [Version] version Version that contains the resource
                    # @return [BrandRegistrationList] BrandRegistrationList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/a2p/BrandRegistrations"
                        
                    end
                    ##
                    # Create the BrandRegistrationInstance
                    # @param [String] customer_profile_bundle_sid Customer Profile Bundle Sid.
                    # @param [String] a2p_profile_bundle_sid A2P Messaging Profile Bundle Sid.
                    # @param [String] brand_type Type of brand being created. One of: \\\"STANDARD\\\", \\\"STARTER\\\". STARTER is for low volume, starter use cases. STANDARD is for all other use cases.
                    # @param [Boolean] mock A boolean that specifies whether brand should be a mock or not. If true, brand will be registered as a mock brand. Defaults to false if no value is provided.
                    # @param [Boolean] skip_automatic_sec_vet A flag to disable automatic secondary vetting for brands which it would otherwise be done.
                    # @return [BrandRegistrationInstance] Created BrandRegistrationInstance
                    def create(
                        customer_profile_bundle_sid: nil, 
                        a2p_profile_bundle_sid: nil, 
                        brand_type: :unset, 
                        mock: :unset, 
                        skip_automatic_sec_vet: :unset
                    )

                        data = Twilio::Values.of({
                            'CustomerProfileBundleSid' => customer_profile_bundle_sid,
                            'A2PProfileBundleSid' => a2p_profile_bundle_sid,
                            'BrandType' => brand_type,
                            'Mock' => mock,
                            'SkipAutomaticSecVet' => skip_automatic_sec_vet,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        BrandRegistrationInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists BrandRegistrationInstance records from the API as a list.
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
                    # When passed a block, yields BrandRegistrationInstance records from the API.
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
                    # Retrieve a single page of BrandRegistrationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of BrandRegistrationInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        BrandRegistrationPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of BrandRegistrationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of BrandRegistrationInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    BrandRegistrationPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Messaging.V1.BrandRegistrationList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class BrandRegistrationContext < InstanceContext
                    ##
                    # Initialize the BrandRegistrationContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Brand Registration resource to update.
                    # @return [BrandRegistrationContext] BrandRegistrationContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/a2p/BrandRegistrations/#{@solution[:sid]}"

                        # Dependents
                        @brand_vettings = nil
                    end
                    ##
                    # Fetch the BrandRegistrationInstance
                    # @return [BrandRegistrationInstance] Fetched BrandRegistrationInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        BrandRegistrationInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the BrandRegistrationInstance
                    # @return [BrandRegistrationInstance] Updated BrandRegistrationInstance
                    def update

                        payload = @version.update('POST', @uri)
                        BrandRegistrationInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the brand_vettings
                    # @return [BrandVettingList]
                    # @return [BrandVettingContext] if sid was passed.
                    def brand_vettings(brand_vetting_sid=:unset)

                        raise ArgumentError, 'brand_vetting_sid cannot be nil' if brand_vetting_sid.nil?

                        if brand_vetting_sid != :unset
                            return BrandVettingContext.new(@version, @solution[:sid],brand_vetting_sid )
                        end

                        unless @brand_vettings
                            @brand_vettings = BrandVettingList.new(
                                @version, brand_sid: @solution[:sid],  )
                        end

                     @brand_vettings
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Messaging.V1.BrandRegistrationContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Messaging.V1.BrandRegistrationContext #{context}>"
                    end
                end

                class BrandRegistrationPage < Page
                    ##
                    # Initialize the BrandRegistrationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [BrandRegistrationPage] BrandRegistrationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of BrandRegistrationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [BrandRegistrationInstance] BrandRegistrationInstance
                    def get_instance(payload)
                        BrandRegistrationInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Messaging.V1.BrandRegistrationPage>'
                    end
                end
                class BrandRegistrationInstance < InstanceResource
                    ##
                    # Initialize the BrandRegistrationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this BrandRegistration
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [BrandRegistrationInstance] BrandRegistrationInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'customer_profile_bundle_sid' => payload['customer_profile_bundle_sid'],
                            'a2p_profile_bundle_sid' => payload['a2p_profile_bundle_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'brand_type' => payload['brand_type'],
                            'status' => payload['status'],
                            'tcr_id' => payload['tcr_id'],
                            'failure_reason' => payload['failure_reason'],
                            'url' => payload['url'],
                            'brand_score' => payload['brand_score'] == nil ? payload['brand_score'] : payload['brand_score'].to_i,
                            'brand_feedback' => payload['brand_feedback'],
                            'identity_status' => payload['identity_status'],
                            'russell_3000' => payload['russell_3000'],
                            'government_entity' => payload['government_entity'],
                            'tax_exempt_status' => payload['tax_exempt_status'],
                            'skip_automatic_sec_vet' => payload['skip_automatic_sec_vet'],
                            'mock' => payload['mock'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [BrandRegistrationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = BrandRegistrationContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string to identify Brand Registration.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Brand Registration resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] A2P Messaging Profile Bundle BundleSid.
                    def customer_profile_bundle_sid
                        @properties['customer_profile_bundle_sid']
                    end
                    
                    ##
                    # @return [String] A2P Messaging Profile Bundle BundleSid.
                    def a2p_profile_bundle_sid
                        @properties['a2p_profile_bundle_sid']
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
                    # @return [String] Type of brand. One of: \"STANDARD\", \"STARTER\". STARTER is for the low volume, STARTER campaign use case. There can only be one STARTER campaign created per STARTER brand. STANDARD is for all other campaign use cases. Multiple campaign use cases can be created per STANDARD brand.
                    def brand_type
                        @properties['brand_type']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] Campaign Registry (TCR) Brand ID. Assigned only after successful brand registration.
                    def tcr_id
                        @properties['tcr_id']
                    end
                    
                    ##
                    # @return [String] A reason why brand registration has failed. Only applicable when status is FAILED.
                    def failure_reason
                        @properties['failure_reason']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Brand Registration resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The secondary vetting score if it was done. Otherwise, it will be the brand score if it's returned from TCR. It may be null if no score is available.
                    def brand_score
                        @properties['brand_score']
                    end
                    
                    ##
                    # @return [Array<BrandFeedback>] Feedback on how to improve brand score
                    def brand_feedback
                        @properties['brand_feedback']
                    end
                    
                    ##
                    # @return [IdentityStatus] 
                    def identity_status
                        @properties['identity_status']
                    end
                    
                    ##
                    # @return [Boolean] Publicly traded company identified in the Russell 3000 Index
                    def russell_3000
                        @properties['russell_3000']
                    end
                    
                    ##
                    # @return [Boolean] Identified as a government entity
                    def government_entity
                        @properties['government_entity']
                    end
                    
                    ##
                    # @return [String] Nonprofit organization tax-exempt status per section 501 of the U.S. tax code.
                    def tax_exempt_status
                        @properties['tax_exempt_status']
                    end
                    
                    ##
                    # @return [Boolean] A flag to disable automatic secondary vetting for brands which it would otherwise be done.
                    def skip_automatic_sec_vet
                        @properties['skip_automatic_sec_vet']
                    end
                    
                    ##
                    # @return [Boolean] A boolean that specifies whether brand should be a mock or not. If true, brand will be registered as a mock brand. Defaults to false if no value is provided.
                    def mock
                        @properties['mock']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the BrandRegistrationInstance
                    # @return [BrandRegistrationInstance] Fetched BrandRegistrationInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the BrandRegistrationInstance
                    # @return [BrandRegistrationInstance] Updated BrandRegistrationInstance
                    def update

                        context.update
                    end

                    ##
                    # Access the brand_vettings
                    # @return [brand_vettings] brand_vettings
                    def brand_vettings
                        context.brand_vettings
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Messaging.V1.BrandRegistrationInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Messaging.V1.BrandRegistrationInstance #{values}>"
                    end
                end

            end
        end
    end
end

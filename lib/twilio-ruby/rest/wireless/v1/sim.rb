##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Wireless
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Wireless < WirelessBase
            class V1 < Version
                class SimList < ListResource
                
                    ##
                    # Initialize the SimList
                    # @param [Version] version Version that contains the resource
                    # @return [SimList] SimList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Sims"
                        
                    end
                
                    ##
                    # Lists SimInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Status] status Only return Sim resources with this status.
                    # @param [String] iccid Only return Sim resources with this ICCID. This will return a list with a maximum size of 1.
                    # @param [String] rate_plan The SID or unique name of a [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource). Only return Sim resources assigned to this RatePlan resource.
                    # @param [String] e_id Deprecated.
                    # @param [String] sim_registration_code Only return Sim resources with this registration code. This will return a list with a maximum size of 1.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(status: :unset, iccid: :unset, rate_plan: :unset, e_id: :unset, sim_registration_code: :unset, limit: nil, page_size: nil)
                        self.stream(
                            status: status,
                            iccid: iccid,
                            rate_plan: rate_plan,
                            e_id: e_id,
                            sim_registration_code: sim_registration_code,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Status] status Only return Sim resources with this status.
                    # @param [String] iccid Only return Sim resources with this ICCID. This will return a list with a maximum size of 1.
                    # @param [String] rate_plan The SID or unique name of a [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource). Only return Sim resources assigned to this RatePlan resource.
                    # @param [String] e_id Deprecated.
                    # @param [String] sim_registration_code Only return Sim resources with this registration code. This will return a list with a maximum size of 1.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(status: :unset, iccid: :unset, rate_plan: :unset, e_id: :unset, sim_registration_code: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            status: status,
                            iccid: iccid,
                            rate_plan: rate_plan,
                            e_id: e_id,
                            sim_registration_code: sim_registration_code,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields SimInstance records from the API.
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
                    # Retrieve a single page of SimInstance records from the API.
                    # Request is executed immediately.
                    # @param [Status] status Only return Sim resources with this status.
                    # @param [String] iccid Only return Sim resources with this ICCID. This will return a list with a maximum size of 1.
                    # @param [String] rate_plan The SID or unique name of a [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource). Only return Sim resources assigned to this RatePlan resource.
                    # @param [String] e_id Deprecated.
                    # @param [String] sim_registration_code Only return Sim resources with this registration code. This will return a list with a maximum size of 1.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SimInstance
                    def page(status: :unset, iccid: :unset, rate_plan: :unset, e_id: :unset, sim_registration_code: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Status' => status,
                            'Iccid' => iccid,
                            'RatePlan' => rate_plan,
                            'EId' => e_id,
                            'SimRegistrationCode' => sim_registration_code,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        SimPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SimInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SimInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SimPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Wireless.V1.SimList>'
                    end
                end


                class SimContext < InstanceContext
                    ##
                    # Initialize the SimContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID or the `unique_name` of the Sim resource to update.
                    # @return [SimContext] SimContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Sims/#{@solution[:sid]}"

                        # Dependents
                        @data_sessions = nil
                        @usage_records = nil
                    end
                    ##
                    # Delete the SimInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the SimInstance
                    # @return [SimInstance] Fetched SimInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        SimInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the SimInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used in place of the `sid` in the URL path to address the resource.
                    # @param [String] callback_method The HTTP method we should use to call `callback_url`. Can be: `POST` or `GET`. The default is `POST`.
                    # @param [String] callback_url The URL we should call using the `callback_url` when the SIM has finished updating. When the SIM transitions from `new` to `ready` or from any status to `deactivated`, we call this URL when the status changes to an intermediate status (`ready` or `deactivated`) and again when the status changes to its final status (`active` or `canceled`).
                    # @param [String] friendly_name A descriptive string that you create to describe the Sim resource. It does not need to be unique.
                    # @param [String] rate_plan The SID or unique name of the [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource) to which the Sim resource should be assigned.
                    # @param [Status] status 
                    # @param [String] commands_callback_method The HTTP method we should use to call `commands_callback_url`. Can be: `POST` or `GET`. The default is `POST`.
                    # @param [String] commands_callback_url The URL we should call using the `commands_callback_method` when the SIM sends a [Command](https://www.twilio.com/docs/iot/wireless/api/command-resource). Your server should respond with an HTTP status code in the 200 range; any response body is ignored.
                    # @param [String] sms_fallback_method The HTTP method we should use to call `sms_fallback_url`. Can be: `GET` or `POST`. Default is `POST`.
                    # @param [String] sms_fallback_url The URL we should call using the `sms_fallback_method` when an error occurs while retrieving or executing the TwiML requested from `sms_url`.
                    # @param [String] sms_method The HTTP method we should use to call `sms_url`. Can be: `GET` or `POST`. Default is `POST`.
                    # @param [String] sms_url The URL we should call using the `sms_method` when the SIM-connected device sends an SMS message that is not a [Command](https://www.twilio.com/docs/iot/wireless/api/command-resource).
                    # @param [String] voice_fallback_method Deprecated.
                    # @param [String] voice_fallback_url Deprecated.
                    # @param [String] voice_method Deprecated.
                    # @param [String] voice_url Deprecated.
                    # @param [ResetStatus] reset_status 
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) to which the Sim resource should belong. The Account SID can only be that of the requesting Account or that of a [Subaccount](https://www.twilio.com/docs/iam/api/subaccounts) of the requesting Account. Only valid when the Sim resource's status is `new`. For more information, see the [Move SIMs between Subaccounts documentation](https://www.twilio.com/docs/iot/wireless/api/sim-resource#move-sims-between-subaccounts).
                    # @return [SimInstance] Updated SimInstance
                    def update(
                        unique_name: :unset, 
                        callback_method: :unset, 
                        callback_url: :unset, 
                        friendly_name: :unset, 
                        rate_plan: :unset, 
                        status: :unset, 
                        commands_callback_method: :unset, 
                        commands_callback_url: :unset, 
                        sms_fallback_method: :unset, 
                        sms_fallback_url: :unset, 
                        sms_method: :unset, 
                        sms_url: :unset, 
                        voice_fallback_method: :unset, 
                        voice_fallback_url: :unset, 
                        voice_method: :unset, 
                        voice_url: :unset, 
                        reset_status: :unset, 
                        account_sid: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'CallbackMethod' => callback_method,
                            'CallbackUrl' => callback_url,
                            'FriendlyName' => friendly_name,
                            'RatePlan' => rate_plan,
                            'Status' => status,
                            'CommandsCallbackMethod' => commands_callback_method,
                            'CommandsCallbackUrl' => commands_callback_url,
                            'SmsFallbackMethod' => sms_fallback_method,
                            'SmsFallbackUrl' => sms_fallback_url,
                            'SmsMethod' => sms_method,
                            'SmsUrl' => sms_url,
                            'VoiceFallbackMethod' => voice_fallback_method,
                            'VoiceFallbackUrl' => voice_fallback_url,
                            'VoiceMethod' => voice_method,
                            'VoiceUrl' => voice_url,
                            'ResetStatus' => reset_status,
                            'AccountSid' => account_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        SimInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the data_sessions
                    # @return [DataSessionList]
                    # @return [DataSessionContext]
                    def data_sessions
                      unless @data_sessions
                        @data_sessions = DataSessionList.new(
                                @version, sim_sid: @solution[:sid], )
                      end
                      @data_sessions
                    end
                    ##
                    # Access the usage_records
                    # @return [UsageRecordList]
                    # @return [UsageRecordContext]
                    def usage_records
                      unless @usage_records
                        @usage_records = UsageRecordList.new(
                                @version, sim_sid: @solution[:sid], )
                      end
                      @usage_records
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Wireless.V1.SimContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Wireless.V1.SimContext #{context}>"
                    end
                end

                class SimPage < Page
                    ##
                    # Initialize the SimPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SimPage] SimPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SimInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SimInstance] SimInstance
                    def get_instance(payload)
                        SimInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Wireless.V1.SimPage>'
                    end
                end
                class SimInstance < InstanceResource
                    ##
                    # Initialize the SimInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Sim
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SimInstance] SimInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'unique_name' => payload['unique_name'],
                            'account_sid' => payload['account_sid'],
                            'rate_plan_sid' => payload['rate_plan_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'iccid' => payload['iccid'],
                            'e_id' => payload['e_id'],
                            'status' => payload['status'],
                            'reset_status' => payload['reset_status'],
                            'commands_callback_url' => payload['commands_callback_url'],
                            'commands_callback_method' => payload['commands_callback_method'],
                            'sms_fallback_method' => payload['sms_fallback_method'],
                            'sms_fallback_url' => payload['sms_fallback_url'],
                            'sms_method' => payload['sms_method'],
                            'sms_url' => payload['sms_url'],
                            'voice_fallback_method' => payload['voice_fallback_method'],
                            'voice_fallback_url' => payload['voice_fallback_url'],
                            'voice_method' => payload['voice_method'],
                            'voice_url' => payload['voice_url'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                            'ip_address' => payload['ip_address'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SimContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SimContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Sim resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) to which the Sim resource belongs.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource) to which the Sim resource is assigned.
                    def rate_plan_sid
                        @properties['rate_plan_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the Sim resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The [ICCID](https://en.wikipedia.org/wiki/SIM_card#ICCID) associated with the SIM.
                    def iccid
                        @properties['iccid']
                    end
                    
                    ##
                    # @return [String] Deprecated.
                    def e_id
                        @properties['e_id']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [ResetStatus] 
                    def reset_status
                        @properties['reset_status']
                    end
                    
                    ##
                    # @return [String] The URL we call using the `commands_callback_method` when the SIM originates a machine-to-machine [Command](https://www.twilio.com/docs/iot/wireless/api/command-resource). Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.
                    def commands_callback_url
                        @properties['commands_callback_url']
                    end
                    
                    ##
                    # @return [String] The HTTP method we use to call `commands_callback_url`.  Can be: `POST` or `GET`. Default is `POST`.
                    def commands_callback_method
                        @properties['commands_callback_method']
                    end
                    
                    ##
                    # @return [String] Deprecated.
                    def sms_fallback_method
                        @properties['sms_fallback_method']
                    end
                    
                    ##
                    # @return [String] Deprecated.
                    def sms_fallback_url
                        @properties['sms_fallback_url']
                    end
                    
                    ##
                    # @return [String] Deprecated.
                    def sms_method
                        @properties['sms_method']
                    end
                    
                    ##
                    # @return [String] Deprecated.
                    def sms_url
                        @properties['sms_url']
                    end
                    
                    ##
                    # @return [String] Deprecated. The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`. Default is `POST`.
                    def voice_fallback_method
                        @properties['voice_fallback_method']
                    end
                    
                    ##
                    # @return [String] Deprecated. The URL we call using the `voice_fallback_method` when an error occurs while retrieving or executing the TwiML requested from `voice_url`.
                    def voice_fallback_url
                        @properties['voice_fallback_url']
                    end
                    
                    ##
                    # @return [String] Deprecated. The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`. Default is `POST`.
                    def voice_method
                        @properties['voice_method']
                    end
                    
                    ##
                    # @return [String] Deprecated. The URL we call using the `voice_method` when the SIM-connected device makes a voice call.
                    def voice_url
                        @properties['voice_url']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Sim resource was last updated specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related subresources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [String] Deprecated.
                    def ip_address
                        @properties['ip_address']
                    end
                    
                    ##
                    # Delete the SimInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the SimInstance
                    # @return [SimInstance] Fetched SimInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SimInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. It can be used in place of the `sid` in the URL path to address the resource.
                    # @param [String] callback_method The HTTP method we should use to call `callback_url`. Can be: `POST` or `GET`. The default is `POST`.
                    # @param [String] callback_url The URL we should call using the `callback_url` when the SIM has finished updating. When the SIM transitions from `new` to `ready` or from any status to `deactivated`, we call this URL when the status changes to an intermediate status (`ready` or `deactivated`) and again when the status changes to its final status (`active` or `canceled`).
                    # @param [String] friendly_name A descriptive string that you create to describe the Sim resource. It does not need to be unique.
                    # @param [String] rate_plan The SID or unique name of the [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource) to which the Sim resource should be assigned.
                    # @param [Status] status 
                    # @param [String] commands_callback_method The HTTP method we should use to call `commands_callback_url`. Can be: `POST` or `GET`. The default is `POST`.
                    # @param [String] commands_callback_url The URL we should call using the `commands_callback_method` when the SIM sends a [Command](https://www.twilio.com/docs/iot/wireless/api/command-resource). Your server should respond with an HTTP status code in the 200 range; any response body is ignored.
                    # @param [String] sms_fallback_method The HTTP method we should use to call `sms_fallback_url`. Can be: `GET` or `POST`. Default is `POST`.
                    # @param [String] sms_fallback_url The URL we should call using the `sms_fallback_method` when an error occurs while retrieving or executing the TwiML requested from `sms_url`.
                    # @param [String] sms_method The HTTP method we should use to call `sms_url`. Can be: `GET` or `POST`. Default is `POST`.
                    # @param [String] sms_url The URL we should call using the `sms_method` when the SIM-connected device sends an SMS message that is not a [Command](https://www.twilio.com/docs/iot/wireless/api/command-resource).
                    # @param [String] voice_fallback_method Deprecated.
                    # @param [String] voice_fallback_url Deprecated.
                    # @param [String] voice_method Deprecated.
                    # @param [String] voice_url Deprecated.
                    # @param [ResetStatus] reset_status 
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) to which the Sim resource should belong. The Account SID can only be that of the requesting Account or that of a [Subaccount](https://www.twilio.com/docs/iam/api/subaccounts) of the requesting Account. Only valid when the Sim resource's status is `new`. For more information, see the [Move SIMs between Subaccounts documentation](https://www.twilio.com/docs/iot/wireless/api/sim-resource#move-sims-between-subaccounts).
                    # @return [SimInstance] Updated SimInstance
                    def update(
                        unique_name: :unset, 
                        callback_method: :unset, 
                        callback_url: :unset, 
                        friendly_name: :unset, 
                        rate_plan: :unset, 
                        status: :unset, 
                        commands_callback_method: :unset, 
                        commands_callback_url: :unset, 
                        sms_fallback_method: :unset, 
                        sms_fallback_url: :unset, 
                        sms_method: :unset, 
                        sms_url: :unset, 
                        voice_fallback_method: :unset, 
                        voice_fallback_url: :unset, 
                        voice_method: :unset, 
                        voice_url: :unset, 
                        reset_status: :unset, 
                        account_sid: :unset
                    )

                        context.update(
                            unique_name: unique_name, 
                            callback_method: callback_method, 
                            callback_url: callback_url, 
                            friendly_name: friendly_name, 
                            rate_plan: rate_plan, 
                            status: status, 
                            commands_callback_method: commands_callback_method, 
                            commands_callback_url: commands_callback_url, 
                            sms_fallback_method: sms_fallback_method, 
                            sms_fallback_url: sms_fallback_url, 
                            sms_method: sms_method, 
                            sms_url: sms_url, 
                            voice_fallback_method: voice_fallback_method, 
                            voice_fallback_url: voice_fallback_url, 
                            voice_method: voice_method, 
                            voice_url: voice_url, 
                            reset_status: reset_status, 
                            account_sid: account_sid, 
                        )
                    end

                    ##
                    # Access the data_sessions
                    # @return [data_sessions] data_sessions
                    def data_sessions
                        context.data_sessions
                    end

                    ##
                    # Access the usage_records
                    # @return [usage_records] usage_records
                    def usage_records
                        context.usage_records
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Wireless.V1.SimInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Wireless.V1.SimInstance #{values}>"
                    end
                end

            end
        end
    end
end

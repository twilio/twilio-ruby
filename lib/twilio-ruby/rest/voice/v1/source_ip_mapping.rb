##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Voice
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Voice < VoiceBase
            class V1 < Version
                class SourceIpMappingList < ListResource
                
                    ##
                    # Initialize the SourceIpMappingList
                    # @param [Version] version Version that contains the resource
                    # @return [SourceIpMappingList] SourceIpMappingList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/SourceIpMappings"
                        
                    end
                    ##
                    # Create the SourceIpMappingInstance
                    # @param [String] ip_record_sid The Twilio-provided string that uniquely identifies the IP Record resource to map from.
                    # @param [String] sip_domain_sid The SID of the SIP Domain that the IP Record should be mapped to.
                    # @return [SourceIpMappingInstance] Created SourceIpMappingInstance
                    def create(
                        ip_record_sid: nil, 
                        sip_domain_sid: nil
                    )

                        data = Twilio::Values.of({
                            'IpRecordSid' => ip_record_sid,
                            'SipDomainSid' => sip_domain_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        SourceIpMappingInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists SourceIpMappingInstance records from the API as a list.
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
                    # When passed a block, yields SourceIpMappingInstance records from the API.
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
                    # Retrieve a single page of SourceIpMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SourceIpMappingInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        SourceIpMappingPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SourceIpMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SourceIpMappingInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SourceIpMappingPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Voice.V1.SourceIpMappingList>'
                    end
                end


                class SourceIpMappingContext < InstanceContext
                    ##
                    # Initialize the SourceIpMappingContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The Twilio-provided string that uniquely identifies the IP Record resource to update.
                    # @return [SourceIpMappingContext] SourceIpMappingContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/SourceIpMappings/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the SourceIpMappingInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the SourceIpMappingInstance
                    # @return [SourceIpMappingInstance] Fetched SourceIpMappingInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        SourceIpMappingInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the SourceIpMappingInstance
                    # @param [String] sip_domain_sid The SID of the SIP Domain that the IP Record should be mapped to.
                    # @return [SourceIpMappingInstance] Updated SourceIpMappingInstance
                    def update(
                        sip_domain_sid: nil
                    )

                        data = Twilio::Values.of({
                            'SipDomainSid' => sip_domain_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        SourceIpMappingInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Voice.V1.SourceIpMappingContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Voice.V1.SourceIpMappingContext #{context}>"
                    end
                end

                class SourceIpMappingPage < Page
                    ##
                    # Initialize the SourceIpMappingPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SourceIpMappingPage] SourceIpMappingPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SourceIpMappingInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SourceIpMappingInstance] SourceIpMappingInstance
                    def get_instance(payload)
                        SourceIpMappingInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Voice.V1.SourceIpMappingPage>'
                    end
                end
                class SourceIpMappingInstance < InstanceResource
                    ##
                    # Initialize the SourceIpMappingInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SourceIpMapping
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SourceIpMappingInstance] SourceIpMappingInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'ip_record_sid' => payload['ip_record_sid'],
                            'sip_domain_sid' => payload['sip_domain_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SourceIpMappingContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SourceIpMappingContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the IP Record resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The Twilio-provided string that uniquely identifies the IP Record resource to map from.
                    def ip_record_sid
                        @properties['ip_record_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the SIP Domain that the IP Record is mapped to.
                    def sip_domain_sid
                        @properties['sip_domain_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the SourceIpMappingInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the SourceIpMappingInstance
                    # @return [SourceIpMappingInstance] Fetched SourceIpMappingInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SourceIpMappingInstance
                    # @param [String] sip_domain_sid The SID of the SIP Domain that the IP Record should be mapped to.
                    # @return [SourceIpMappingInstance] Updated SourceIpMappingInstance
                    def update(
                        sip_domain_sid: nil
                    )

                        context.update(
                            sip_domain_sid: sip_domain_sid, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Voice.V1.SourceIpMappingInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Voice.V1.SourceIpMappingInstance #{values}>"
                    end
                end

            end
        end
    end
end

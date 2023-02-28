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
                class ConferenceContext < InstanceContext

                     class RecordingList < ListResource
                    ##
                    # Initialize the RecordingList
                    # @param [Version] version Version that contains the resource
                    # @return [RecordingList] RecordingList
                    def initialize(version, account_sid: nil, conference_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid,conference_sid: conference_sid, }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:conference_sid]}/Recordings.json"
                        
                    end
                
                    ##
                    # Lists RecordingInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Date] date_created The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [Date] date_created_before The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [Date] date_created_after The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(date_created: :unset, date_created_before: :unset, date_created_after: :unset, limit: nil, page_size: nil)
                        self.stream(
                            date_created: date_created,
                            date_created_before: date_created_before,
                            date_created_after: date_created_after,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Date] date_created The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [Date] date_created_before The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [Date] date_created_after The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(date_created: :unset, date_created_before: :unset, date_created_after: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            date_created: date_created,
                            date_created_before: date_created_before,
                            date_created_after: date_created_after,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields RecordingInstance records from the API.
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
                    # Retrieve a single page of RecordingInstance records from the API.
                    # Request is executed immediately.
                    # @param [Date] date_created The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [Date] date_created_before The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [Date] date_created_after The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of RecordingInstance
                    def page(date_created: :unset, date_created_before: :unset, date_created_after: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'DateCreated' =>  Twilio.serialize_iso8601_date(date_created),
                            
                            'DateCreated<' =>  Twilio.serialize_iso8601_date(date_created_before),
                            
                            'DateCreated>' =>  Twilio.serialize_iso8601_date(date_created_after),
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        RecordingPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of RecordingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of RecordingInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    RecordingPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.RecordingList>'
                    end
                end

                class RecordingContext < InstanceContext
                    ##
                    # Initialize the RecordingContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Conference Recording resource to update.
                    # @param [String] conference_sid The Conference SID that identifies the conference associated with the recording to update.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Conference Recording resource to update. Use `Twilio.CURRENT` to reference the current active recording.
                    # @return [RecordingContext] RecordingContext
                    def initialize(version, account_sid, conference_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { account_sid: account_sid, conference_sid: conference_sid, sid: sid,  }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:conference_sid]}/Recordings/#{@solution[:sid]}.json"

                        
                    end
                    ##
                    # Delete the RecordingInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the RecordingInstance
                    # @return [RecordingInstance] Fetched RecordingInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        RecordingInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            conference_sid: @solution[:conference_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the RecordingInstance
                    # @param [ConferenceRecordingStatus] status 
                    # @param [String] pause_behavior Whether to record during a pause. Can be: `skip` or `silence` and the default is `silence`. `skip` does not record during the pause period, while `silence` will replace the actual audio of the call with silence during the pause period. This parameter only applies when setting `status` is set to `paused`.
                    # @return [RecordingInstance] Updated RecordingInstance
                    def update(
                        status: nil, 
                        pause_behavior: :unset
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                            'PauseBehavior' => pause_behavior,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        RecordingInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            conference_sid: @solution[:conference_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.RecordingContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.RecordingContext #{context}>"
                    end
                end

                class RecordingPage < Page
                    ##
                    # Initialize the RecordingPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [RecordingPage] RecordingPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of RecordingInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [RecordingInstance] RecordingInstance
                    def get_instance(payload)
                        RecordingInstance.new(@version, payload, account_sid: @solution[:account_sid], conference_sid: @solution[:conference_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.RecordingPage>'
                    end
                end
                class RecordingInstance < InstanceResource
                    ##
                    # Initialize the RecordingInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Recording
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [RecordingInstance] RecordingInstance
                    def initialize(version, payload , account_sid: nil, conference_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'api_version' => payload['api_version'],
                            'call_sid' => payload['call_sid'],
                            'conference_sid' => payload['conference_sid'],
                            'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                            'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                            'start_time' => Twilio.deserialize_rfc2822(payload['start_time']),
                            'duration' => payload['duration'],
                            'sid' => payload['sid'],
                            'price' => payload['price'],
                            'price_unit' => payload['price_unit'],
                            'status' => payload['status'],
                            'channels' => payload['channels'] == nil ? payload['channels'] : payload['channels'].to_i,
                            'source' => payload['source'],
                            'error_code' => payload['error_code'] == nil ? payload['error_code'] : payload['error_code'].to_i,
                            'encryption_details' => payload['encryption_details'],
                            'uri' => payload['uri'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'account_sid' => account_sid  ,'conference_sid' => conference_sid  || @properties['conference_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [RecordingContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = RecordingContext.new(@version , @params['account_sid'], @params['conference_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Conference Recording resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The API version used to create the recording.
                    def api_version
                        @properties['api_version']
                    end
                    
                    ##
                    # @return [String] The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Conference Recording resource is associated with.
                    def call_sid
                        @properties['call_sid']
                    end
                    
                    ##
                    # @return [String] The Conference SID that identifies the conference associated with the recording.
                    def conference_sid
                        @properties['conference_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Time] The start time of the recording in GMT and in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
                    def start_time
                        @properties['start_time']
                    end
                    
                    ##
                    # @return [String] The length of the recording in seconds.
                    def duration
                        @properties['duration']
                    end
                    
                    ##
                    # @return [String] The unique string that that we created to identify the Conference Recording resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The one-time cost of creating the recording in the `price_unit` currency.
                    def price
                        @properties['price']
                    end
                    
                    ##
                    # @return [String] The currency used in the `price` property. Example: `USD`.
                    def price_unit
                        @properties['price_unit']
                    end
                    
                    ##
                    # @return [ConferenceRecordingStatus] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The number of channels in the final recording file.  Can be: `1`, or `2`. Separating a two leg call into two separate channels of the recording file is supported in [Dial](https://www.twilio.com/docs/voice/twiml/dial#attributes-record) and [Outbound Rest API](https://www.twilio.com/docs/voice/make-calls) record options.
                    def channels
                        @properties['channels']
                    end
                    
                    ##
                    # @return [ConferenceRecordingSource] 
                    def source
                        @properties['source']
                    end
                    
                    ##
                    # @return [String] The error code that describes why the recording is `absent`. The error code is described in our [Error Dictionary](https://www.twilio.com/docs/api/errors). This value is null if the recording `status` is not `absent`.
                    def error_code
                        @properties['error_code']
                    end
                    
                    ##
                    # @return [Hash] How to decrypt the recording if it was encrypted using [Call Recording Encryption](https://www.twilio.com/docs/voice/tutorials/voice-recording-encryption) feature.
                    def encryption_details
                        @properties['encryption_details']
                    end
                    
                    ##
                    # @return [String] The URI of the resource, relative to `https://api.twilio.com`.
                    def uri
                        @properties['uri']
                    end
                    
                    ##
                    # Delete the RecordingInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the RecordingInstance
                    # @return [RecordingInstance] Fetched RecordingInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the RecordingInstance
                    # @param [ConferenceRecordingStatus] status 
                    # @param [String] pause_behavior Whether to record during a pause. Can be: `skip` or `silence` and the default is `silence`. `skip` does not record during the pause period, while `silence` will replace the actual audio of the call with silence during the pause period. This parameter only applies when setting `status` is set to `paused`.
                    # @return [RecordingInstance] Updated RecordingInstance
                    def update(
                        status: nil, 
                        pause_behavior: :unset
                    )

                        context.update(
                            status: status, 
                            pause_behavior: pause_behavior, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.RecordingInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.RecordingInstance #{values}>"
                    end
                end
             end
             end
            end
        end
    end
end



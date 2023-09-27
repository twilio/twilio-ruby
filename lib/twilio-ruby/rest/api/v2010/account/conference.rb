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

                     class ConferenceList < ListResource
                    ##
                    # Initialize the ConferenceList
                    # @param [Version] version Version that contains the resource
                    # @return [ConferenceList] ConferenceList
                    def initialize(version, account_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Conferences.json"
                        
                    end
                
                    ##
                    # Lists ConferenceInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Date] date_created The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_created_before The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_created_after The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_updated The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [Date] date_updated_before The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [Date] date_updated_after The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [String] friendly_name The string that identifies the Conference resources to read.
                    # @param [Status] status The status of the resources to read. Can be: `init`, `in-progress`, or `completed`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(date_created: :unset, date_created_before: :unset, date_created_after: :unset, date_updated: :unset, date_updated_before: :unset, date_updated_after: :unset, friendly_name: :unset, status: :unset, limit: nil, page_size: nil)
                        self.stream(
                            date_created: date_created,
                            date_created_before: date_created_before,
                            date_created_after: date_created_after,
                            date_updated: date_updated,
                            date_updated_before: date_updated_before,
                            date_updated_after: date_updated_after,
                            friendly_name: friendly_name,
                            status: status,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Date] date_created The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_created_before The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_created_after The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_updated The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [Date] date_updated_before The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [Date] date_updated_after The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [String] friendly_name The string that identifies the Conference resources to read.
                    # @param [Status] status The status of the resources to read. Can be: `init`, `in-progress`, or `completed`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(date_created: :unset, date_created_before: :unset, date_created_after: :unset, date_updated: :unset, date_updated_before: :unset, date_updated_after: :unset, friendly_name: :unset, status: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            date_created: date_created,
                            date_created_before: date_created_before,
                            date_created_after: date_created_after,
                            date_updated: date_updated,
                            date_updated_before: date_updated_before,
                            date_updated_after: date_updated_after,
                            friendly_name: friendly_name,
                            status: status,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields ConferenceInstance records from the API.
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
                    # Retrieve a single page of ConferenceInstance records from the API.
                    # Request is executed immediately.
                    # @param [Date] date_created The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_created_before The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_created_after The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that started on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify  conferences that started on or after midnight on a date, use `>=YYYY-MM-DD`.
                    # @param [Date] date_updated The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [Date] date_updated_before The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [Date] date_updated_after The `date_updated` value, specified as `YYYY-MM-DD`, of the resources to read. To read conferences that were last updated on or before midnight on a date, use `<=YYYY-MM-DD`, and to specify conferences that were last updated on or after midnight on a given date, use  `>=YYYY-MM-DD`.
                    # @param [String] friendly_name The string that identifies the Conference resources to read.
                    # @param [Status] status The status of the resources to read. Can be: `init`, `in-progress`, or `completed`.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ConferenceInstance
                    def page(date_created: :unset, date_created_before: :unset, date_created_after: :unset, date_updated: :unset, date_updated_before: :unset, date_updated_after: :unset, friendly_name: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'DateCreated' =>  Twilio.serialize_iso8601_date(date_created),
                            'DateCreated<' =>  Twilio.serialize_iso8601_date(date_created_before),
                            'DateCreated>' =>  Twilio.serialize_iso8601_date(date_created_after),
                            'DateUpdated' =>  Twilio.serialize_iso8601_date(date_updated),
                            'DateUpdated<' =>  Twilio.serialize_iso8601_date(date_updated_before),
                            'DateUpdated>' =>  Twilio.serialize_iso8601_date(date_updated_after),
                            'FriendlyName' => friendly_name,
                            'Status' => status,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ConferencePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ConferenceInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ConferenceInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ConferencePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.ConferenceList>'
                    end
                end


                class ConferenceContext < InstanceContext
                    ##
                    # Initialize the ConferenceContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Conference resource(s) to update.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Conference resource to update
                    # @return [ConferenceContext] ConferenceContext
                    def initialize(version, account_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { account_sid: account_sid, sid: sid,  }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:sid]}.json"

                        # Dependents
                        @recordings = nil
                        @participants = nil
                    end
                    ##
                    # Fetch the ConferenceInstance
                    # @return [ConferenceInstance] Fetched ConferenceInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        ConferenceInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ConferenceInstance
                    # @param [UpdateStatus] status 
                    # @param [String] announce_url The URL we should call to announce something into the conference. The URL may return an MP3 file, a WAV file, or a TwiML document that contains `<Play>`, `<Say>`, `<Pause>`, or `<Redirect>` verbs.
                    # @param [String] announce_method The HTTP method used to call `announce_url`. Can be: `GET` or `POST` and the default is `POST`
                    # @return [ConferenceInstance] Updated ConferenceInstance
                    def update(
                        status: :unset, 
                        announce_url: :unset, 
                        announce_method: :unset
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                            'AnnounceUrl' => announce_url,
                            'AnnounceMethod' => announce_method,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        ConferenceInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the recordings
                    # @return [RecordingList]
                    # @return [RecordingContext] if sid was passed.
                    def recordings(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return RecordingContext.new(@version, @solution[:account_sid], @solution[:sid],sid )
                        end

                        unless @recordings
                            @recordings = RecordingList.new(
                                @version, account_sid: @solution[:account_sid], conference_sid: @solution[:sid], )
                        end

                     @recordings
                    end
                    ##
                    # Access the participants
                    # @return [ParticipantList]
                    # @return [ParticipantContext] if sid was passed.
                    def participants(call_sid=:unset)

                        raise ArgumentError, 'call_sid cannot be nil' if call_sid.nil?

                        if call_sid != :unset
                            return ParticipantContext.new(@version, @solution[:account_sid], @solution[:sid],call_sid )
                        end

                        unless @participants
                            @participants = ParticipantList.new(
                                @version, account_sid: @solution[:account_sid], conference_sid: @solution[:sid], )
                        end

                     @participants
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.ConferenceContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.ConferenceContext #{context}>"
                    end
                end

                class ConferencePage < Page
                    ##
                    # Initialize the ConferencePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ConferencePage] ConferencePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ConferenceInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ConferenceInstance] ConferenceInstance
                    def get_instance(payload)
                        ConferenceInstance.new(@version, payload, account_sid: @solution[:account_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.ConferencePage>'
                    end
                end
                class ConferenceInstance < InstanceResource
                    ##
                    # Initialize the ConferenceInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Conference
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ConferenceInstance] ConferenceInstance
                    def initialize(version, payload , account_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                            'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                            'api_version' => payload['api_version'],
                            'friendly_name' => payload['friendly_name'],
                            'region' => payload['region'],
                            'sid' => payload['sid'],
                            'status' => payload['status'],
                            'uri' => payload['uri'],
                            'subresource_uris' => payload['subresource_uris'],
                            'reason_conference_ended' => payload['reason_conference_ended'],
                            'call_sid_ending_conference' => payload['call_sid_ending_conference'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'account_sid' => account_sid  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ConferenceContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ConferenceContext.new(@version , @params['account_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Conference resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The API version used to create this conference.
                    def api_version
                        @properties['api_version']
                    end
                    
                    ##
                    # @return [String] A string that you assigned to describe this conference room. Maxiumum length is 128 characters.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] A string that represents the Twilio Region where the conference audio was mixed. May be `us1`, `ie1`,  `de1`, `sg1`, `br1`, `au1`, and `jp1`. Basic conference audio will always be mixed in `us1`. Global Conference audio will be mixed nearest to the majority of participants.
                    def region
                        @properties['region']
                    end
                    
                    ##
                    # @return [String] The unique string that that we created to identify this Conference resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The URI of this resource, relative to `https://api.twilio.com`.
                    def uri
                        @properties['uri']
                    end
                    
                    ##
                    # @return [Hash] A list of related resources identified by their URIs relative to `https://api.twilio.com`.
                    def subresource_uris
                        @properties['subresource_uris']
                    end
                    
                    ##
                    # @return [ReasonConferenceEnded] 
                    def reason_conference_ended
                        @properties['reason_conference_ended']
                    end
                    
                    ##
                    # @return [String] The call SID that caused the conference to end.
                    def call_sid_ending_conference
                        @properties['call_sid_ending_conference']
                    end
                    
                    ##
                    # Fetch the ConferenceInstance
                    # @return [ConferenceInstance] Fetched ConferenceInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ConferenceInstance
                    # @param [UpdateStatus] status 
                    # @param [String] announce_url The URL we should call to announce something into the conference. The URL may return an MP3 file, a WAV file, or a TwiML document that contains `<Play>`, `<Say>`, `<Pause>`, or `<Redirect>` verbs.
                    # @param [String] announce_method The HTTP method used to call `announce_url`. Can be: `GET` or `POST` and the default is `POST`
                    # @return [ConferenceInstance] Updated ConferenceInstance
                    def update(
                        status: :unset, 
                        announce_url: :unset, 
                        announce_method: :unset
                    )

                        context.update(
                            status: status, 
                            announce_url: announce_url, 
                            announce_method: announce_method, 
                        )
                    end

                    ##
                    # Access the recordings
                    # @return [recordings] recordings
                    def recordings
                        context.recordings
                    end

                    ##
                    # Access the participants
                    # @return [participants] participants
                    def participants
                        context.participants
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.ConferenceInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.ConferenceInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end



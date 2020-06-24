##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Proxy < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class SessionList < ListResource
            ##
            # Initialize the SessionList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/proxy/api/service) the session is
            #   associated with.
            # @return [SessionList] SessionList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Sessions"
            end

            ##
            # Lists SessionInstance records from the API as a list.
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
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams SessionInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields SessionInstance records from the API.
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
            # Retrieve a single page of SessionInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of SessionInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params)

              SessionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of SessionInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of SessionInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              SessionPage.new(@version, response, @solution)
            end

            ##
            # Create the SessionInstance
            # @param [String] unique_name An application-defined string that uniquely
            #   identifies the resource. This value must be 191 characters or fewer in length
            #   and be unique. **This value should not have PII.**
            # @param [Time] date_expiry The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            #   date when the Session should expire. If this is value is present, it overrides
            #   the `ttl` value.
            # @param [String] ttl The time, in seconds, when the session will expire. The time
            #   is measured from the last Session create or the Session's last Interaction.
            # @param [session.Mode] mode The Mode of the Session. Can be: `message-only`,
            #   `voice-only`, or `voice-and-message` and the default value is
            #   `voice-and-message`.
            # @param [session.Status] status The initial status of the Session. Can be:
            #   `open`, `in-progress`, `closed`, `failed`, or `unknown`. The default is `open`
            #   on create.
            # @param [Hash] participants The Participant objects to include in the new
            #   session.
            # @return [SessionInstance] Created SessionInstance
            def create(unique_name: :unset, date_expiry: :unset, ttl: :unset, mode: :unset, status: :unset, participants: :unset)
              data = Twilio::Values.of({
                  'UniqueName' => unique_name,
                  'DateExpiry' => Twilio.serialize_iso8601_datetime(date_expiry),
                  'Ttl' => ttl,
                  'Mode' => mode,
                  'Status' => status,
                  'Participants' => Twilio.serialize_list(participants) { |e| Twilio.serialize_object(e) },
              })

              payload = @version.create('POST', @uri, data: data)

              SessionInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Proxy.V1.SessionList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class SessionPage < Page
            ##
            # Initialize the SessionPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [SessionPage] SessionPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of SessionInstance
            # @param [Hash] payload Payload response from the API
            # @return [SessionInstance] SessionInstance
            def get_instance(payload)
              SessionInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Proxy.V1.SessionPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class SessionContext < InstanceContext
            ##
            # Initialize the SessionContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the parent
            #   [Service](https://www.twilio.com/docs/proxy/api/service) of the resource to
            #   fetch.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Session resource to fetch.
            # @return [SessionContext] SessionContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:sid]}"

              # Dependents
              @interactions = nil
              @participants = nil
            end

            ##
            # Fetch the SessionInstance
            # @return [SessionInstance] Fetched SessionInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              SessionInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Delete the SessionInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Update the SessionInstance
            # @param [Time] date_expiry The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            #   date when the Session should expire. If this is value is present, it overrides
            #   the `ttl` value.
            # @param [String] ttl The time, in seconds, when the session will expire. The time
            #   is measured from the last Session create or the Session's last Interaction.
            # @param [session.Status] status The new status of the resource. Can be:
            #   `in-progress` to re-open a session or `closed` to close a session.
            # @return [SessionInstance] Updated SessionInstance
            def update(date_expiry: :unset, ttl: :unset, status: :unset)
              data = Twilio::Values.of({
                  'DateExpiry' => Twilio.serialize_iso8601_datetime(date_expiry),
                  'Ttl' => ttl,
                  'Status' => status,
              })

              payload = @version.update('POST', @uri, data: data)

              SessionInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Access the interactions
            # @return [InteractionList]
            # @return [InteractionContext] if sid was passed.
            def interactions(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return InteractionContext.new(@version, @solution[:service_sid], @solution[:sid], sid, )
              end

              unless @interactions
                @interactions = InteractionList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:sid],
                )
              end

              @interactions
            end

            ##
            # Access the participants
            # @return [ParticipantList]
            # @return [ParticipantContext] if sid was passed.
            def participants(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return ParticipantContext.new(@version, @solution[:service_sid], @solution[:sid], sid, )
              end

              unless @participants
                @participants = ParticipantList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:sid],
                )
              end

              @participants
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Proxy.V1.SessionContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Proxy.V1.SessionContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class SessionInstance < InstanceResource
            ##
            # Initialize the SessionInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/proxy/api/service) the session is
            #   associated with.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Session resource to fetch.
            # @return [SessionInstance] SessionInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'service_sid' => payload['service_sid'],
                  'account_sid' => payload['account_sid'],
                  'date_started' => Twilio.deserialize_iso8601_datetime(payload['date_started']),
                  'date_ended' => Twilio.deserialize_iso8601_datetime(payload['date_ended']),
                  'date_last_interaction' => Twilio.deserialize_iso8601_datetime(payload['date_last_interaction']),
                  'date_expiry' => Twilio.deserialize_iso8601_datetime(payload['date_expiry']),
                  'unique_name' => payload['unique_name'],
                  'status' => payload['status'],
                  'closed_reason' => payload['closed_reason'],
                  'ttl' => payload['ttl'].to_i,
                  'mode' => payload['mode'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [SessionContext] SessionContext for this SessionInstance
            def context
              unless @instance_context
                @instance_context = SessionContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the resource's parent Service
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The ISO 8601 date when the Session started
            def date_started
              @properties['date_started']
            end

            ##
            # @return [Time] The ISO 8601 date when the Session ended
            def date_ended
              @properties['date_ended']
            end

            ##
            # @return [Time] The ISO 8601 date when the Session last had an interaction
            def date_last_interaction
              @properties['date_last_interaction']
            end

            ##
            # @return [Time] The ISO 8601 date when the Session should expire
            def date_expiry
              @properties['date_expiry']
            end

            ##
            # @return [String] An application-defined string that uniquely identifies the resource
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [session.Status] The status of the Session
            def status
              @properties['status']
            end

            ##
            # @return [String] The reason the Session ended
            def closed_reason
              @properties['closed_reason']
            end

            ##
            # @return [String] When the session will expire
            def ttl
              @properties['ttl']
            end

            ##
            # @return [session.Mode] The Mode of the Session
            def mode
              @properties['mode']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The absolute URL of the Session resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The URLs of resources related to the Session
            def links
              @properties['links']
            end

            ##
            # Fetch the SessionInstance
            # @return [SessionInstance] Fetched SessionInstance
            def fetch
              context.fetch
            end

            ##
            # Delete the SessionInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Update the SessionInstance
            # @param [Time] date_expiry The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            #   date when the Session should expire. If this is value is present, it overrides
            #   the `ttl` value.
            # @param [String] ttl The time, in seconds, when the session will expire. The time
            #   is measured from the last Session create or the Session's last Interaction.
            # @param [session.Status] status The new status of the resource. Can be:
            #   `in-progress` to re-open a session or `closed` to close a session.
            # @return [SessionInstance] Updated SessionInstance
            def update(date_expiry: :unset, ttl: :unset, status: :unset)
              context.update(date_expiry: date_expiry, ttl: ttl, status: status, )
            end

            ##
            # Access the interactions
            # @return [interactions] interactions
            def interactions
              context.interactions
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
              "<Twilio.Proxy.V1.SessionInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Proxy.V1.SessionInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
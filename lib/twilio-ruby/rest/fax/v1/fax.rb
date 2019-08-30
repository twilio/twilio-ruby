##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Fax < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class FaxList < ListResource
          ##
          # Initialize the FaxList
          # @param [Version] version Version that contains the resource
          # @return [FaxList] FaxList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Faxes"
          end

          ##
          # Lists FaxInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] from Retrieve only those faxes sent from this phone number,
          #   specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.
          # @param [String] to Retrieve only those faxes sent to this phone number,
          #   specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.
          # @param [Time] date_created_on_or_before Retrieve only those faxes with a
          #   `date_created` that is before or equal to this value, specified in [ISO
          #   8601](https://en.wikipedia.org/wiki/ISO_8601) format.
          # @param [Time] date_created_after Retrieve only those faxes with a `date_created`
          #   that is later than this value, specified in [ISO
          #   8601](https://en.wikipedia.org/wiki/ISO_8601) format.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(from: :unset, to: :unset, date_created_on_or_before: :unset, date_created_after: :unset, limit: nil, page_size: nil)
            self.stream(
                from: from,
                to: to,
                date_created_on_or_before: date_created_on_or_before,
                date_created_after: date_created_after,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams FaxInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] from Retrieve only those faxes sent from this phone number,
          #   specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.
          # @param [String] to Retrieve only those faxes sent to this phone number,
          #   specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.
          # @param [Time] date_created_on_or_before Retrieve only those faxes with a
          #   `date_created` that is before or equal to this value, specified in [ISO
          #   8601](https://en.wikipedia.org/wiki/ISO_8601) format.
          # @param [Time] date_created_after Retrieve only those faxes with a `date_created`
          #   that is later than this value, specified in [ISO
          #   8601](https://en.wikipedia.org/wiki/ISO_8601) format.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(from: :unset, to: :unset, date_created_on_or_before: :unset, date_created_after: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                from: from,
                to: to,
                date_created_on_or_before: date_created_on_or_before,
                date_created_after: date_created_after,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields FaxInstance records from the API.
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
          # Retrieve a single page of FaxInstance records from the API.
          # Request is executed immediately.
          # @param [String] from Retrieve only those faxes sent from this phone number,
          #   specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.
          # @param [String] to Retrieve only those faxes sent to this phone number,
          #   specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.
          # @param [Time] date_created_on_or_before Retrieve only those faxes with a
          #   `date_created` that is before or equal to this value, specified in [ISO
          #   8601](https://en.wikipedia.org/wiki/ISO_8601) format.
          # @param [Time] date_created_after Retrieve only those faxes with a `date_created`
          #   that is later than this value, specified in [ISO
          #   8601](https://en.wikipedia.org/wiki/ISO_8601) format.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of FaxInstance
          def page(from: :unset, to: :unset, date_created_on_or_before: :unset, date_created_after: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'From' => from,
                'To' => to,
                'DateCreatedOnOrBefore' => Twilio.serialize_iso8601_datetime(date_created_on_or_before),
                'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            FaxPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of FaxInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of FaxInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            FaxPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of FaxInstance records from the API.
          # Request is executed immediately.
          # @param [String] to The phone number to receive the fax in
          #   [E.164](https://www.twilio.com/docs/glossary/what-e164) format or the
          #   recipient's SIP URI.
          # @param [String] media_url The Twilio-hosted URL of the PDF that contains the
          #   fax. See our [security](https://www.twilio.com/docs/security) page for
          #   information on how to ensure the request for your media comes from Twilio.
          # @param [fax.Quality] quality The [Fax Quality
          #   value](https://www.twilio.com/docs/api/fax/rest/faxes-resource#fax-quality-values) that describes the fax quality. Can be: `standard`, `fine`, or `superfine` and defaults to `fine`.
          # @param [String] status_callback The URL we should call using the `POST` method
          #   to send [status
          #   information](https://www.twilio.com/docs/api/fax/rest/faxes-resource#fax-status-callback) to your application when the status of the fax changes.
          # @param [String] from The number the fax was sent from. Can be the phone number
          #   in [E.164](https://www.twilio.com/docs/glossary/what-e164) format or the SIP
          #   `from` value. The caller ID displayed to the recipient uses this value. If this
          #   is a phone number, it must be a Twilio number or a verified outgoing caller id
          #   from your account. If `to` is a SIP address, this can be any alphanumeric string
          #   (and also the characters `+`, `_`, `.`, and `-`), which will be used in the
          #   `from` header of the SIP request.
          # @param [String] sip_auth_username The username to use with the
          #   `sip_auth_password` to authenticate faxes sent to a SIP address.
          # @param [String] sip_auth_password The password to use with `sip_auth_username`
          #   to authenticate faxes sent to a SIP address.
          # @param [Boolean] store_media Whether to store a copy of the sent media on our
          #   servers for later retrieval. Can be: `true` or `false` and the default is
          #   `true`.
          # @param [String] ttl How long in minutes from when the fax is initiated that we
          #   should try to send the fax.
          # @return [FaxInstance] Newly created FaxInstance
          def create(to: nil, media_url: nil, quality: :unset, status_callback: :unset, from: :unset, sip_auth_username: :unset, sip_auth_password: :unset, store_media: :unset, ttl: :unset)
            data = Twilio::Values.of({
                'To' => to,
                'MediaUrl' => media_url,
                'Quality' => quality,
                'StatusCallback' => status_callback,
                'From' => from,
                'SipAuthUsername' => sip_auth_username,
                'SipAuthPassword' => sip_auth_password,
                'StoreMedia' => store_media,
                'Ttl' => ttl,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            FaxInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Fax.V1.FaxList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class FaxPage < Page
          ##
          # Initialize the FaxPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [FaxPage] FaxPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of FaxInstance
          # @param [Hash] payload Payload response from the API
          # @return [FaxInstance] FaxInstance
          def get_instance(payload)
            FaxInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Fax.V1.FaxPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class FaxContext < InstanceContext
          ##
          # Initialize the FaxContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Twilio-provided string that uniquely identifies the Fax
          #   resource to fetch.
          # @return [FaxContext] FaxContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Faxes/#{@solution[:sid]}"

            # Dependents
            @media = nil
          end

          ##
          # Fetch a FaxInstance
          # @return [FaxInstance] Fetched FaxInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            FaxInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the FaxInstance
          # @param [fax.UpdateStatus] status The new
          #   [status](https://www.twilio.com/docs/api/fax/rest/faxes-resource#fax-status-values) of the resource. Can be only `canceled`. This may fail if transmission has already started.
          # @return [FaxInstance] Updated FaxInstance
          def update(status: :unset)
            data = Twilio::Values.of({'Status' => status, })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            FaxInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the FaxInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Access the media
          # @return [FaxMediaList]
          # @return [FaxMediaContext] if sid was passed.
          def media(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return FaxMediaContext.new(@version, @solution[:sid], sid, )
            end

            unless @media
              @media = FaxMediaList.new(@version, fax_sid: @solution[:sid], )
            end

            @media
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Fax.V1.FaxContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Fax.V1.FaxContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class FaxInstance < InstanceResource
          ##
          # Initialize the FaxInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Twilio-provided string that uniquely identifies the Fax
          #   resource to fetch.
          # @return [FaxInstance] FaxInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'from' => payload['from'],
                'to' => payload['to'],
                'quality' => payload['quality'],
                'media_sid' => payload['media_sid'],
                'media_url' => payload['media_url'],
                'num_pages' => payload['num_pages'] == nil ? payload['num_pages'] : payload['num_pages'].to_i,
                'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                'status' => payload['status'],
                'direction' => payload['direction'],
                'api_version' => payload['api_version'],
                'price' => payload['price'].to_f,
                'price_unit' => payload['price_unit'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'links' => payload['links'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [FaxContext] FaxContext for this FaxInstance
          def context
            unless @instance_context
              @instance_context = FaxContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The number the fax was sent from
          def from
            @properties['from']
          end

          ##
          # @return [String] The phone number that received the fax
          def to
            @properties['to']
          end

          ##
          # @return [fax.Quality] The quality of the fax
          def quality
            @properties['quality']
          end

          ##
          # @return [String] The SID of the FaxMedia resource that is associated with the Fax
          def media_sid
            @properties['media_sid']
          end

          ##
          # @return [String] The Twilio-hosted URL that can be used to download fax media
          def media_url
            @properties['media_url']
          end

          ##
          # @return [String] The number of pages contained in the fax document
          def num_pages
            @properties['num_pages']
          end

          ##
          # @return [String] The time it took to transmit the fax
          def duration
            @properties['duration']
          end

          ##
          # @return [fax.Status] The status of the fax
          def status
            @properties['status']
          end

          ##
          # @return [fax.Direction] The direction of the fax
          def direction
            @properties['direction']
          end

          ##
          # @return [String] The API version used to transmit the fax
          def api_version
            @properties['api_version']
          end

          ##
          # @return [String] The fax transmission price
          def price
            @properties['price']
          end

          ##
          # @return [String] The ISO 4217 currency used for billing
          def price_unit
            @properties['price_unit']
          end

          ##
          # @return [Time] The ISO 8601 formatted date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The ISO 8601 formatted date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The URLs of the fax's related resources
          def links
            @properties['links']
          end

          ##
          # @return [String] The absolute URL of the fax resource
          def url
            @properties['url']
          end

          ##
          # Fetch a FaxInstance
          # @return [FaxInstance] Fetched FaxInstance
          def fetch
            context.fetch
          end

          ##
          # Update the FaxInstance
          # @param [fax.UpdateStatus] status The new
          #   [status](https://www.twilio.com/docs/api/fax/rest/faxes-resource#fax-status-values) of the resource. Can be only `canceled`. This may fail if transmission has already started.
          # @return [FaxInstance] Updated FaxInstance
          def update(status: :unset)
            context.update(status: status, )
          end

          ##
          # Deletes the FaxInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Access the media
          # @return [media] media
          def media
            context.media
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Fax.V1.FaxInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Fax.V1.FaxInstance #{values}>"
          end
        end
      end
    end
  end
end
##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionList < ListResource
          ##
          # Initialize the CompositionList
          # @param [Version] version Version that contains the resource
          # @return [CompositionList] CompositionList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Compositions"
          end

          ##
          # Lists CompositionInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [composition.Status] status Only show Compositions with the given status.
          # @param [Time] date_created_after Only show Compositions that started on or after
          #   this ISO8601 date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
          # @param [Time] date_created_before Only show Compositions that started before
          #   this this ISO8601 date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
          # @param [String] room_sid Only show Compositions with the given Room SID.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, limit: nil, page_size: nil)
            self.stream(
                status: status,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                room_sid: room_sid,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams CompositionInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [composition.Status] status Only show Compositions with the given status.
          # @param [Time] date_created_after Only show Compositions that started on or after
          #   this ISO8601 date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
          # @param [Time] date_created_before Only show Compositions that started before
          #   this this ISO8601 date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
          # @param [String] room_sid Only show Compositions with the given Room SID.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                status: status,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                room_sid: room_sid,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields CompositionInstance records from the API.
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
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [composition.Status] status Only show Compositions with the given status.
          # @param [Time] date_created_after Only show Compositions that started on or after
          #   this ISO8601 date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
          # @param [Time] date_created_before Only show Compositions that started before
          #   this this ISO8601 date-time, given as `YYYY-MM-DDThh:mm:ss-hh:mm`.
          # @param [String] room_sid Only show Compositions with the given Room SID.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of CompositionInstance
          def page(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Status' => status,
                'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                'RoomSid' => room_sid,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            CompositionPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of CompositionInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            CompositionPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [String] room_sid Group Room SID owning the media tracks to be used as
          #   Composition sources.
          # @param [Hash] video_layout A JSON object defining the video layout of the
          #   Composition in terms of regions. See the section [Managing Video
          #   Layouts](#managing-video-layouts) below for further information.
          # @param [String] audio_sources An array of audio sources to merge. All the
          #   specified sources must belong to the same Group Room. It can include: 
          #   * Zero or more `RecordingTrackSid`
          #   * Zero or more `MediaTrackSid`
          #   * Zero or more `ParticipantSid`
          #   * Zero or more Track names. These can be specified using wildcards (e.g.
          #   `student*`)
          # @param [String] audio_sources_excluded An array of audio sources to exclude from
          #   the Composition. Any new Composition shall include all audio sources specified
          #   in `AudioSources` except for the ones specified in `AudioSourcesExcluded`. This
          #   parameter may include: 
          #   * Zero or more `RecordingTrackSid`
          #   * Zero or more `MediaTrackSid`
          #   * Zero or more `ParticipantSid`
          #   * Zero or more Track names. These can be specified using wildcards (e.g.
          #   `student*`)
          # @param [String] resolution A string representing the numbers of pixels for rows
          #   (width) and columns (height) of the generated composed video. This string must
          #   have the format `{width}x{height}`. This parameter must comply with the
          #   following constraints: 
          #   * `width >= 16 && width <= 1280`
          #   * `height >= 16 && height <= 1280`
          #   * `width * height <= 921,600`
          #   Typical values are: 
          #   * HD = `1280x720`
          #   * PAL = `1024x576`
          #   * VGA = `640x480`
          #   * CIF = `320x240`
          #   Note that the `Resolution` implicitly imposes an aspect ratio to the resulting
          #   composition. When the original video tracks get constrained by this aspect ratio
          #   they are scaled-down to fit. You can find detailed information in the [Managing
          #   Video Layouts](#managing-video-layouts) section. Defaults to `640x480`.
          # @param [composition.Format] format Container format of the Composition media
          #   file. Can be any of the following: `mp4`, `webm`. The use of `mp4` or `webm`
          #   makes mandatory the specification of `AudioSources` and/or one `VideoLayout`
          #   element containing a valid `video_sources` list, otherwise an error is fired.
          #   Defaults to `webm`.
          # @param [String] status_callback A URL that Twilio sends asynchronous webhook
          #   requests to on every composition event. If not provided, status callback events
          #   will not be dispatched.
          # @param [String] status_callback_method HTTP method Twilio should use when
          #   requesting the above URL. Defaults to `POST`.
          # @param [Boolean] trim When activated, clips all the Composition intervals where
          #   there is no active media. This results in shorter compositions in cases when the
          #   Room was created but no Participant joined for some time, or if all the
          #   Participants left the room and joined at a later stage, as those gaps will be
          #   removed. You can find further information in the [Managing Video
          #   Layouts](#managing-video-layouts) section. Defaults to `true`.
          # @return [CompositionInstance] Newly created CompositionInstance
          def create(room_sid: :unset, video_layout: :unset, audio_sources: :unset, audio_sources_excluded: :unset, resolution: :unset, format: :unset, status_callback: :unset, status_callback_method: :unset, trim: :unset)
            data = Twilio::Values.of({
                'RoomSid' => room_sid,
                'VideoLayout' => Twilio.serialize_object(video_layout),
                'AudioSources' => Twilio.serialize_list(audio_sources) { |e| e },
                'AudioSourcesExcluded' => Twilio.serialize_list(audio_sources_excluded) { |e| e },
                'Resolution' => resolution,
                'Format' => format,
                'StatusCallback' => status_callback,
                'StatusCallbackMethod' => status_callback_method,
                'Trim' => trim,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            CompositionInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Video.V1.CompositionList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionPage < Page
          ##
          # Initialize the CompositionPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CompositionPage] CompositionPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CompositionInstance
          # @param [Hash] payload Payload response from the API
          # @return [CompositionInstance] CompositionInstance
          def get_instance(payload)
            CompositionInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Video.V1.CompositionPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionContext < InstanceContext
          ##
          # Initialize the CompositionContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Composition Sid that uniquely identifies the Composition
          #   to fetch.
          # @return [CompositionContext] CompositionContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Compositions/#{@solution[:sid]}"
          end

          ##
          # Fetch a CompositionInstance
          # @return [CompositionInstance] Fetched CompositionInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            CompositionInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the CompositionInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.CompositionContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionInstance < InstanceResource
          ##
          # Initialize the CompositionInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Composition Sid that uniquely identifies the Composition
          #   to fetch.
          # @return [CompositionInstance] CompositionInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'status' => payload['status'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_completed' => payload['date_completed'],
                'date_deleted' => payload['date_deleted'],
                'sid' => payload['sid'],
                'room_sid' => payload['room_sid'],
                'audio_sources' => payload['audio_sources'],
                'audio_sources_excluded' => payload['audio_sources_excluded'],
                'video_layout' => payload['video_layout'],
                'resolution' => payload['resolution'],
                'trim' => payload['trim'],
                'format' => payload['format'],
                'bitrate' => payload['bitrate'].to_i,
                'size' => payload['size'].to_i,
                'duration' => payload['duration'].to_i,
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CompositionContext] CompositionContext for this CompositionInstance
          def context
            unless @instance_context
              @instance_context = CompositionContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] Twilio Account SID.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [composition.Status] The status of the Composition.
          def status
            @properties['status']
          end

          ##
          # @return [Time] Date when the Composition Resource was created.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [String] Date when the media processing task finished.
          def date_completed
            @properties['date_completed']
          end

          ##
          # @return [String] Date when the Composition Resource generated media was deleted.
          def date_deleted
            @properties['date_deleted']
          end

          ##
          # @return [String] A 34-character string that uniquely identifies this Composition.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] A 34-character string that uniquely identifies the source of this Composition.
          def room_sid
            @properties['room_sid']
          end

          ##
          # @return [String] A list of audio sources related to this Composition.
          def audio_sources
            @properties['audio_sources']
          end

          ##
          # @return [String] A list of audio sources excluded related to this Composition.
          def audio_sources_excluded
            @properties['audio_sources_excluded']
          end

          ##
          # @return [Hash] The JSON video layout description.
          def video_layout
            @properties['video_layout']
          end

          ##
          # @return [String] Pixel resolution of the composed video.
          def resolution
            @properties['resolution']
          end

          ##
          # @return [Boolean] Boolean flag for clipping intervals that have no media.
          def trim
            @properties['trim']
          end

          ##
          # @return [composition.Format] The file format for this Composition.
          def format
            @properties['format']
          end

          ##
          # @return [String] The bitrate
          def bitrate
            @properties['bitrate']
          end

          ##
          # @return [String] Size of the Composed media file expressed in bytes.
          def size
            @properties['size']
          end

          ##
          # @return [String] Duration of the Composed media in seconds.
          def duration
            @properties['duration']
          end

          ##
          # @return [String] The absolute URL for this resource.
          def url
            @properties['url']
          end

          ##
          # @return [String] JSON object with the URL where the media file can be fetched.
          def links
            @properties['links']
          end

          ##
          # Fetch a CompositionInstance
          # @return [CompositionInstance] Fetched CompositionInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the CompositionInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionInstance #{values}>"
          end
        end
      end
    end
  end
end
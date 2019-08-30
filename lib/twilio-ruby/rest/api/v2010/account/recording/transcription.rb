##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class RecordingContext < InstanceContext
            class TranscriptionList < ListResource
              ##
              # Initialize the TranscriptionList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
              #   Transcription resource.
              # @param [String] recording_sid The SID of the
              #   [Recording](https://www.twilio.com/docs/voice/api/recording) from which the
              #   transcription was created.
              # @return [TranscriptionList] TranscriptionList
              def initialize(version, account_sid: nil, recording_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, recording_sid: recording_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:recording_sid]}/Transcriptions.json"
              end

              ##
              # Lists TranscriptionInstance records from the API as a list.
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
              # Streams TranscriptionInstance records from the API as an Enumerable.
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
              # When passed a block, yields TranscriptionInstance records from the API.
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
              # Retrieve a single page of TranscriptionInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of TranscriptionInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                TranscriptionPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of TranscriptionInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of TranscriptionInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                TranscriptionPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.TranscriptionList>'
              end
            end

            class TranscriptionPage < Page
              ##
              # Initialize the TranscriptionPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [TranscriptionPage] TranscriptionPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of TranscriptionInstance
              # @param [Hash] payload Payload response from the API
              # @return [TranscriptionInstance] TranscriptionInstance
              def get_instance(payload)
                TranscriptionInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    recording_sid: @solution[:recording_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.TranscriptionPage>'
              end
            end

            class TranscriptionContext < InstanceContext
              ##
              # Initialize the TranscriptionContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
              #   Transcription resource to fetch.
              # @param [String] recording_sid The SID of the
              #   [Recording](https://www.twilio.com/docs/voice/api/recording) that created the
              #   transcription to fetch.
              # @param [String] sid The Twilio-provided string that uniquely identifies the
              #   Transcription resource to fetch.
              # @return [TranscriptionContext] TranscriptionContext
              def initialize(version, account_sid, recording_sid, sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, recording_sid: recording_sid, sid: sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:recording_sid]}/Transcriptions/#{@solution[:sid]}.json"
              end

              ##
              # Fetch a TranscriptionInstance
              # @return [TranscriptionInstance] Fetched TranscriptionInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                TranscriptionInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    recording_sid: @solution[:recording_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the TranscriptionInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.TranscriptionContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.TranscriptionContext #{context}>"
              end
            end

            class TranscriptionInstance < InstanceResource
              ##
              # Initialize the TranscriptionInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
              #   Transcription resource.
              # @param [String] recording_sid The SID of the
              #   [Recording](https://www.twilio.com/docs/voice/api/recording) from which the
              #   transcription was created.
              # @param [String] sid The Twilio-provided string that uniquely identifies the
              #   Transcription resource to fetch.
              # @return [TranscriptionInstance] TranscriptionInstance
              def initialize(version, payload, account_sid: nil, recording_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'api_version' => payload['api_version'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'duration' => payload['duration'],
                    'price' => payload['price'].to_f,
                    'price_unit' => payload['price_unit'],
                    'recording_sid' => payload['recording_sid'],
                    'sid' => payload['sid'],
                    'status' => payload['status'],
                    'transcription_text' => payload['transcription_text'],
                    'type' => payload['type'],
                    'uri' => payload['uri'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'recording_sid' => recording_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [TranscriptionContext] TranscriptionContext for this TranscriptionInstance
              def context
                unless @instance_context
                  @instance_context = TranscriptionContext.new(
                      @version,
                      @params['account_sid'],
                      @params['recording_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The API version used to create the transcription
              def api_version
                @properties['api_version']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that the resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The duration of the transcribed audio in seconds.
              def duration
                @properties['duration']
              end

              ##
              # @return [String] The charge for the transcription
              def price
                @properties['price']
              end

              ##
              # @return [String] The currency in which price is measured
              def price_unit
                @properties['price_unit']
              end

              ##
              # @return [String] The SID that identifies the transcription's recording
              def recording_sid
                @properties['recording_sid']
              end

              ##
              # @return [String] The unique string that identifies the resource
              def sid
                @properties['sid']
              end

              ##
              # @return [transcription.Status] The status of the transcription
              def status
                @properties['status']
              end

              ##
              # @return [String] The text content of the transcription.
              def transcription_text
                @properties['transcription_text']
              end

              ##
              # @return [String] The transcription type
              def type
                @properties['type']
              end

              ##
              # @return [String] The URI of the resource, relative to `https://api.twilio.com`
              def uri
                @properties['uri']
              end

              ##
              # Fetch a TranscriptionInstance
              # @return [TranscriptionInstance] Fetched TranscriptionInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the TranscriptionInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.TranscriptionInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.TranscriptionInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
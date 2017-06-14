##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Notify < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class SegmentList < ListResource
            ##
            # Initialize the SegmentList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [SegmentList] SegmentList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid
              }
              @uri = "/Services/#{@solution[:service_sid]}/Segments"
            end

            ##
            # Lists SegmentInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams SegmentInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields SegmentInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of SegmentInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of SegmentInstance
            def page(page_token: Twilio::Values::Unset, page_number: Twilio::Values::Unset, page_size: Twilio::Values.Unset)
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
              return SegmentPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of SegmentInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of SegmentInstance
            def get_page(target_url: nil)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              return SegmentPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Notify.V1.SegmentList>'
            end
          end

          class SegmentPage < Page
            ##
            # Initialize the SegmentPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] service_sid The service_sid
            # @return [SegmentPage] SegmentPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of SegmentInstance
            # @param [Hash] payload Payload response from the API
            # @return [SegmentInstance] SegmentInstance
            def get_instance(payload)
              return SegmentInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Notify.V1.SegmentPage>'
            end
          end

          class SegmentInstance < InstanceResource
            ##
            # Initialize the SegmentInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @return [SegmentInstance] SegmentInstance
            def initialize(version, payload, service_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'unique_name' => payload['unique_name'],
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
              }
            end

            def sid
              @properties['sid']
            end

            def account_sid
              @properties['account_sid']
            end

            def service_sid
              @properties['service_sid']
            end

            def unique_name
              @properties['unique_name']
            end

            def date_created
              @properties['date_created']
            end

            def date_updated
              @properties['date_updated']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Notify.V1.SegmentInstance>"
            end
          end
        end
      end
    end
  end
end
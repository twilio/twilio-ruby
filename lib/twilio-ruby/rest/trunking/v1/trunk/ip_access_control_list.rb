##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Trunking < Domain
      class V1 < Version
        class TrunkContext < InstanceContext
          class IpAccessControlListList < ListResource
            ##
            # Initialize the IpAccessControlListList
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The trunk_sid
            # @return [IpAccessControlListList] IpAccessControlListList
            def initialize(version, trunk_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  trunk_sid: trunk_sid
              }
              @uri = "/Trunks/#{@solution[:trunk_sid]}/IpAccessControlLists"
            end

            ##
            # Retrieve a single page of IpAccessControlListInstance records from the API.
            # Request is executed immediately.
            # @param [String] ip_access_control_list_sid The ip_access_control_list_sid
            # @return [IpAccessControlListInstance] Newly created IpAccessControlListInstance
            def create(ip_access_control_list_sid: nil)
              data = Twilio::Values.of({
                  'IpAccessControlListSid' => ip_access_control_list_sid,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              return IpAccessControlListInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
              )
            end

            ##
            # Lists IpAccessControlListInstance records from the API as a list.
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
            # Streams IpAccessControlListInstance records from the API as an Enumerable.
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
            # When passed a block, yields IpAccessControlListInstance records from the API.
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
            # Retrieve a single page of IpAccessControlListInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of IpAccessControlListInstance
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
              return IpAccessControlListPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of IpAccessControlListInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of IpAccessControlListInstance
            def get_page(target_url: nil)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              return IpAccessControlListPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Trunking.V1.IpAccessControlListList>'
            end
          end

          class IpAccessControlListPage < Page
            ##
            # Initialize the IpAccessControlListPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] trunk_sid The trunk_sid
            # @return [IpAccessControlListPage] IpAccessControlListPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of IpAccessControlListInstance
            # @param [Hash] payload Payload response from the API
            # @return [IpAccessControlListInstance] IpAccessControlListInstance
            def get_instance(payload)
              return IpAccessControlListInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Trunking.V1.IpAccessControlListPage>'
            end
          end

          class IpAccessControlListContext < InstanceContext
            ##
            # Initialize the IpAccessControlListContext
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The trunk_sid
            # @param [String] sid The sid
            # @return [IpAccessControlListContext] IpAccessControlListContext
            def initialize(version, trunk_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  trunk_sid: trunk_sid,
                  sid: sid,
              }
              @uri = "/Trunks/#{@solution[:trunk_sid]}/IpAccessControlLists/#{@solution[:sid]}"
            end

            ##
            # Fetch a IpAccessControlListInstance
            # @return [IpAccessControlListInstance] Fetched IpAccessControlListInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              return IpAccessControlListInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the IpAccessControlListInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Trunking.V1.IpAccessControlListContext #{context}>"
            end
          end

          class IpAccessControlListInstance < InstanceResource
            ##
            # Initialize the IpAccessControlListInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] trunk_sid The trunk_sid
            # @param [String] sid The sid
            # @return [IpAccessControlListInstance] IpAccessControlListInstance
            def initialize(version, payload, trunk_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'sid' => payload['sid'],
                  'trunk_sid' => payload['trunk_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'trunk_sid' => trunk_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [IpAccessControlListContext] IpAccessControlListContext for this IpAccessControlListInstance
            def context
              unless @instance_context
                @instance_context = IpAccessControlListContext.new(
                    @version,
                    @params['trunk_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            def account_sid
              @properties['account_sid']
            end

            def sid
              @properties['sid']
            end

            def trunk_sid
              @properties['trunk_sid']
            end

            def friendly_name
              @properties['friendly_name']
            end

            def date_created
              @properties['date_created']
            end

            def date_updated
              @properties['date_updated']
            end

            def url
              @properties['url']
            end

            ##
            # Fetch a IpAccessControlListInstance
            # @return [IpAccessControlListInstance] Fetched IpAccessControlListInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the IpAccessControlListInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Trunking.V1.IpAccessControlListInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
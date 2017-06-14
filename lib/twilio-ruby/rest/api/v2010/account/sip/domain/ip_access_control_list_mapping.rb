##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class SipList < ListResource
            class DomainContext < InstanceContext
              class IpAccessControlListMappingList < ListResource
                ##
                # Initialize the IpAccessControlListMappingList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The account_sid
                # @param [String] domain_sid A 34 character string that uniquely identifies the
                #   SIP domain in Twilio
                # @return [IpAccessControlListMappingList] IpAccessControlListMappingList
                def initialize(version, account_sid: nil, domain_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {
                      account_sid: account_sid,
                      domain_sid: domain_sid
                  }
                  @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:domain_sid]}/IpAccessControlListMappings.json"
                end

                ##
                # Retrieve a single page of IpAccessControlListMappingInstance records from the API.
                # Request is executed immediately.
                # @param [String] ip_access_control_list_sid The ip_access_control_list_sid
                # @return [IpAccessControlListMappingInstance] Newly created IpAccessControlListMappingInstance
                def create(ip_access_control_list_sid: nil)
                  data = Twilio::Values.of({
                      'IpAccessControlListSid' => ip_access_control_list_sid,
                  })

                  payload = @version.create(
                      'POST',
                      @uri,
                      data: data
                  )

                  return IpAccessControlListMappingInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      domain_sid: @solution[:domain_sid],
                  )
                end

                ##
                # Lists IpAccessControlListMappingInstance records from the API as a list.
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
                # Streams IpAccessControlListMappingInstance records from the API as an Enumerable.
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
                # When passed a block, yields IpAccessControlListMappingInstance records from the API.
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
                # Retrieve a single page of IpAccessControlListMappingInstance records from the API.
                # Request is executed immediately.
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                # @return [Page] Page of IpAccessControlListMappingInstance
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
                  return IpAccessControlListMappingPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of IpAccessControlListMappingInstance records from the API.
                # Request is executed immediately.
                # @param [String] target_url API-generated URL for the requested results page
                # @return [Page] Page of IpAccessControlListMappingInstance
                def get_page(target_url: nil)
                  response = @version.domain.request(
                      'GET',
                      target_url
                  )
                  return IpAccessControlListMappingPage.new(@version, response, @solution)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.IpAccessControlListMappingList>'
                end
              end

              class IpAccessControlListMappingPage < Page
                ##
                # Initialize the IpAccessControlListMappingPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @param [String] account_sid The account_sid
                # @param [String] domain_sid A 34 character string that uniquely identifies the
                #   SIP domain in Twilio
                # @return [IpAccessControlListMappingPage] IpAccessControlListMappingPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of IpAccessControlListMappingInstance
                # @param [Hash] payload Payload response from the API
                # @return [IpAccessControlListMappingInstance] IpAccessControlListMappingInstance
                def get_instance(payload)
                  return IpAccessControlListMappingInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      domain_sid: @solution[:domain_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.IpAccessControlListMappingPage>'
                end
              end

              class IpAccessControlListMappingContext < InstanceContext
                ##
                # Initialize the IpAccessControlListMappingContext
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The account_sid
                # @param [String] domain_sid The domain_sid
                # @param [String] sid The sid
                # @return [IpAccessControlListMappingContext] IpAccessControlListMappingContext
                def initialize(version, account_sid, domain_sid, sid)
                  super(version)

                  # Path Solution
                  @solution = {
                      account_sid: account_sid,
                      domain_sid: domain_sid,
                      sid: sid,
                  }
                  @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:domain_sid]}/IpAccessControlListMappings/#{@solution[:sid]}.json"
                end

                ##
                # Fetch a IpAccessControlListMappingInstance
                # @return [IpAccessControlListMappingInstance] Fetched IpAccessControlListMappingInstance
                def fetch
                  params = Twilio::Values.of({})

                  payload = @version.fetch(
                      'GET',
                      @uri,
                      params,
                  )

                  return IpAccessControlListMappingInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      domain_sid: @solution[:domain_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Deletes the IpAccessControlListMappingInstance
                # @return [Boolean] true if delete succeeds, true otherwise
                def delete
                  return @version.delete('delete', @uri)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Api.V2010.IpAccessControlListMappingContext #{context}>"
                end
              end

              class IpAccessControlListMappingInstance < InstanceResource
                ##
                # Initialize the IpAccessControlListMappingInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid The account_sid
                # @param [String] domain_sid A 34 character string that uniquely identifies the
                #   SIP domain in Twilio
                # @param [String] sid The sid
                # @return [IpAccessControlListMappingInstance] IpAccessControlListMappingInstance
                def initialize(version, payload, account_sid: nil, domain_sid: nil, sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'account_sid' => payload['account_sid'],
                      'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                      'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                      'friendly_name' => payload['friendly_name'],
                      'sid' => payload['sid'],
                      'uri' => payload['uri'],
                      'subresource_uris' => payload['subresource_uris'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {
                      'account_sid' => account_sid,
                      'domain_sid' => domain_sid,
                      'sid' => sid || @properties['sid'],
                  }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @param [Version] version Version that contains the resource
                # @return [IpAccessControlListMappingContext] IpAccessControlListMappingContext for this IpAccessControlListMappingInstance
                def context
                  unless @instance_context
                    @instance_context = IpAccessControlListMappingContext.new(
                        @version,
                        @params['account_sid'],
                        @params['domain_sid'],
                        @params['sid'],
                    )
                  end
                  @instance_context
                end

                def account_sid
                  @properties['account_sid']
                end

                def date_created
                  @properties['date_created']
                end

                def date_updated
                  @properties['date_updated']
                end

                def friendly_name
                  @properties['friendly_name']
                end

                def sid
                  @properties['sid']
                end

                def uri
                  @properties['uri']
                end

                def subresource_uris
                  @properties['subresource_uris']
                end

                ##
                # Fetch a IpAccessControlListMappingInstance
                # @return [IpAccessControlListMappingInstance] Fetched IpAccessControlListMappingInstance
                def fetch
                  context.fetch
                end

                ##
                # Deletes the IpAccessControlListMappingInstance
                # @return [Boolean] true if delete succeeds, true otherwise
                def delete
                  context.delete
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Api.V2010.IpAccessControlListMappingInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end
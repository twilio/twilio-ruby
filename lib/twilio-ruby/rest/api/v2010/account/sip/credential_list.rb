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
            class CredentialListList < ListResource
              ##
              # Initialize the CredentialListList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [CredentialListList] CredentialListList
              def initialize(version, account_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/SIP/CredentialLists.json"
              end

              ##
              # Lists CredentialListInstance records from the API as a list.
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
              # Streams CredentialListInstance records from the API as an Enumerable.
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
              # When passed a block, yields CredentialListInstance records from the API.
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
              # Retrieve a single page of CredentialListInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of CredentialListInstance
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
                CredentialListPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of CredentialListInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of CredentialListInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                CredentialListPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of CredentialListInstance records from the API.
              # Request is executed immediately.
              # @param [String] friendly_name The friendly_name
              # @return [CredentialListInstance] Newly created CredentialListInstance
              def create(friendly_name: nil)
                data = Twilio::Values.of({
                    'FriendlyName' => friendly_name,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                CredentialListInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.CredentialListList>'
              end
            end

            class CredentialListPage < Page
              ##
              # Initialize the CredentialListPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [CredentialListPage] CredentialListPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of CredentialListInstance
              # @param [Hash] payload Payload response from the API
              # @return [CredentialListInstance] CredentialListInstance
              def get_instance(payload)
                CredentialListInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.CredentialListPage>'
              end
            end

            class CredentialListContext < InstanceContext
              ##
              # Initialize the CredentialListContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] sid The credential Sid that uniquely identifies this resource
              # @return [CredentialListContext] CredentialListContext
              def initialize(version, account_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    sid: sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/SIP/CredentialLists/#{@solution[:sid]}.json"

                # Dependents
                @credentials = nil
              end

              ##
              # Fetch a CredentialListInstance
              # @return [CredentialListInstance] Fetched CredentialListInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                CredentialListInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the CredentialListInstance
              # @param [String] friendly_name The friendly_name
              # @return [CredentialListInstance] Updated CredentialListInstance
              def update(friendly_name: nil)
                data = Twilio::Values.of({
                    'FriendlyName' => friendly_name,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                CredentialListInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the CredentialListInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Access the credentials
              # @return [CredentialList] if a(n) CredentialList object was created.
              # @return [CredentialContext] if a(n) CredentialContext object was created.
              def credentials(sid=:unset)
                if sid.nil?
                  raise ArgumentError, 'sid cannot be nil'
                end

                if sid != :unset
                  return CredentialContext.new(
                      @version,
                      @solution[:account_sid],
                      @solution[:sid],
                      sid,
                  )
                end

                unless @credentials
                  @credentials = CredentialList.new(
                      @version,
                      account_sid: @solution[:account_sid],
                      credential_list_sid: @solution[:sid],
                  )
                end

                @credentials
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.CredentialListContext #{context}>"
              end
            end

            class CredentialListInstance < InstanceResource
              ##
              # Initialize the CredentialListInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @param [String] sid The credential Sid that uniquely identifies this resource
              # @return [CredentialListInstance] CredentialListInstance
              def initialize(version, payload, account_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'friendly_name' => payload['friendly_name'],
                    'sid' => payload['sid'],
                    'subresource_uris' => payload['subresource_uris'],
                    'uri' => payload['uri'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [CredentialListContext] CredentialListContext for this CredentialListInstance
              def context
                unless @instance_context
                  @instance_context = CredentialListContext.new(
                      @version,
                      @params['account_sid'],
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

              def subresource_uris
                @properties['subresource_uris']
              end

              def uri
                @properties['uri']
              end

              ##
              # Fetch a CredentialListInstance
              # @return [CredentialListInstance] Fetched CredentialListInstance
              def fetch
                context.fetch
              end

              ##
              # Update the CredentialListInstance
              # @param [String] friendly_name The friendly_name
              # @return [CredentialListInstance] Updated CredentialListInstance
              def update(friendly_name: nil)
                context.update(
                    friendly_name: friendly_name,
                )
              end

              ##
              # Deletes the CredentialListInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Access the credentials
              # @return [credentials] credentials
              def credentials
                context.credentials
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.CredentialListInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Sync < Domain
      class V1 < Version
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The friendly_name
          # @param [String] webhook_url The webhook_url
          # @param [Boolean] reachability_webhooks_enabled The reachability_webhooks_enabled
          # @param [Boolean] acl_enabled The acl_enabled
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(friendly_name: Twilio::Values::Unset, webhook_url: Twilio::Values::Unset, reachability_webhooks_enabled: Twilio::Values::Unset, acl_enabled: Twilio::Values::Unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'WebhookUrl' => webhook_url,
                'ReachabilityWebhooksEnabled' => reachability_webhooks_enabled,
                'AclEnabled' => acl_enabled,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            return ServiceInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Lists ServiceInstance records from the API as a list.
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
          # Streams ServiceInstance records from the API as an Enumerable.
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
          # When passed a block, yields ServiceInstance records from the API.
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
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
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
            return ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url: nil)
            response = @version.domain.request(
                'GET',
                target_url
            )
            return ServicePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Sync.V1.ServiceList>'
          end
        end

        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            return ServiceInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Sync.V1.ServicePage>'
          end
        end

        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @documents = nil
            @sync_lists = nil
            @sync_maps = nil
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            return ServiceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            return @version.delete('delete', @uri)
          end

          ##
          # Update the ServiceInstance
          # @param [String] webhook_url The webhook_url
          # @param [String] friendly_name The friendly_name
          # @param [Boolean] reachability_webhooks_enabled The reachability_webhooks_enabled
          # @param [Boolean] acl_enabled The acl_enabled
          # @return [ServiceInstance] Updated ServiceInstance
          def update(webhook_url: Twilio::Values::Unset, friendly_name: Twilio::Values::Unset, reachability_webhooks_enabled: Twilio::Values::Unset, acl_enabled: Twilio::Values::Unset)
            data = Twilio::Values.of({
                'WebhookUrl' => webhook_url,
                'FriendlyName' => friendly_name,
                'ReachabilityWebhooksEnabled' => reachability_webhooks_enabled,
                'AclEnabled' => acl_enabled,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            return ServiceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Access the documents
          # @return [DocumentList] DocumentList
          def documents(sid=:unset)
            if sid != :unset
              return DocumentContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @documents
              @documents = DocumentList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @documents
          end

          ##
          # Access the sync_lists
          # @return [SyncListList] SyncListList
          def sync_lists(sid=:unset)
            if sid != :unset
              return SyncListContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @sync_lists
              @sync_lists = SyncListList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @sync_lists
          end

          ##
          # Access the sync_maps
          # @return [SyncMapList] SyncMapList
          def sync_maps(sid=:unset)
            if sid != :unset
              return SyncMapContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @sync_maps
              @sync_maps = SyncMapList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @sync_maps
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Sync.V1.ServiceContext #{context}>"
          end
        end

        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                'url' => payload['url'],
                'webhook_url' => payload['webhook_url'],
                'reachability_webhooks_enabled' => payload['reachability_webhooks_enabled'],
                'acl_enabled' => payload['acl_enabled'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end

          def sid
            @properties['sid']
          end

          def account_sid
            @properties['account_sid']
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

          def webhook_url
            @properties['webhook_url']
          end

          def reachability_webhooks_enabled
            @properties['reachability_webhooks_enabled']
          end

          def acl_enabled
            @properties['acl_enabled']
          end

          def links
            @properties['links']
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Update the ServiceInstance
          # @param [String] webhook_url The webhook_url
          # @param [String] friendly_name The friendly_name
          # @param [Boolean] reachability_webhooks_enabled The reachability_webhooks_enabled
          # @param [Boolean] acl_enabled The acl_enabled
          # @return [ServiceInstance] Updated ServiceInstance
          def update(webhook_url: Twilio::Values::Unset, friendly_name: Twilio::Values::Unset, reachability_webhooks_enabled: Twilio::Values::Unset, acl_enabled: Twilio::Values::Unset)
            context.update(
                webhook_url: webhook_url,
                friendly_name: friendly_name,
                reachability_webhooks_enabled: reachability_webhooks_enabled,
                acl_enabled: acl_enabled,
            )
          end

          ##
          # Access the documents
          # @return [documents] documents
          def documents
            context.documents
          end

          ##
          # Access the sync_lists
          # @return [sync_lists] sync_lists
          def sync_lists
            context.sync_lists
          end

          ##
          # Access the sync_maps
          # @return [sync_maps] sync_maps
          def sync_maps
            context.sync_maps
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Sync.V1.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end
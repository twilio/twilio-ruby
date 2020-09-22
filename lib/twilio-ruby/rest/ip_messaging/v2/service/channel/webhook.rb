##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class IpMessaging < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class ChannelContext < InstanceContext
            class WebhookList < ListResource
              ##
              # Initialize the WebhookList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the
              #   {Service}[https://www.twilio.com/docs/chat/rest/service-resource] the Channel
              #   Webhook resource is associated with.
              # @param [String] channel_sid The SID of the
              #   {Channel}[https://www.twilio.com/docs/chat/channels] the Channel Webhook
              #   resource belongs to.
              # @return [WebhookList] WebhookList
              def initialize(version, service_sid: nil, channel_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, channel_sid: channel_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Webhooks"
              end

              ##
              # Lists WebhookInstance records from the API as a list.
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
              # Streams WebhookInstance records from the API as an Enumerable.
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
              # When passed a block, yields WebhookInstance records from the API.
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
              # Retrieve a single page of WebhookInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of WebhookInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                WebhookPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of WebhookInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of WebhookInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                WebhookPage.new(@version, response, @solution)
              end

              ##
              # Create the WebhookInstance
              # @param [webhook.Type] type The type of webhook. Can be: `webhook`, `studio`, or
              #   `trigger`.
              # @param [String] configuration_url The URL of the webhook to call using the
              #   `configuration.method`.
              # @param [webhook.Method] configuration_method The HTTP method used to call
              #   `configuration.url`. Can be: `GET` or `POST` and the default is `POST`.
              # @param [String] configuration_filters The events that cause us to call the
              #   Channel Webhook. Used when `type` is `webhook`. This parameter takes only one
              #   event. To specify more than one event, repeat this parameter for each event. For
              #   the list of possible events, see {Webhook Event
              #   Triggers}[https://www.twilio.com/docs/chat/webhook-events#webhook-event-trigger].
              # @param [String] configuration_triggers A string that will cause us to call the
              #   webhook when it is present in a message body. This parameter takes only one
              #   trigger string. To specify more than one, repeat this parameter for each trigger
              #   string up to a total of 5 trigger strings. Used only when `type` = `trigger`.
              # @param [String] configuration_flow_sid The SID of the Studio
              #   {Flow}[https://www.twilio.com/docs/studio/rest-api/flow] to call when an event
              #   in `configuration.filters` occurs. Used only when `type` is `studio`.
              # @param [String] configuration_retry_count The number of times to retry the
              #   webhook if the first attempt fails. Can be an integer between 0 and 3,
              #   inclusive, and the default is 0.
              # @return [WebhookInstance] Created WebhookInstance
              def create(type: nil, configuration_url: :unset, configuration_method: :unset, configuration_filters: :unset, configuration_triggers: :unset, configuration_flow_sid: :unset, configuration_retry_count: :unset)
                data = Twilio::Values.of({
                    'Type' => type,
                    'Configuration.Url' => configuration_url,
                    'Configuration.Method' => configuration_method,
                    'Configuration.Filters' => Twilio.serialize_list(configuration_filters) { |e| e },
                    'Configuration.Triggers' => Twilio.serialize_list(configuration_triggers) { |e| e },
                    'Configuration.FlowSid' => configuration_flow_sid,
                    'Configuration.RetryCount' => configuration_retry_count,
                })

                payload = @version.create('POST', @uri, data: data)

                WebhookInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.IpMessaging.V2.WebhookList>'
              end
            end

            class WebhookPage < Page
              ##
              # Initialize the WebhookPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [WebhookPage] WebhookPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of WebhookInstance
              # @param [Hash] payload Payload response from the API
              # @return [WebhookInstance] WebhookInstance
              def get_instance(payload)
                WebhookInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.IpMessaging.V2.WebhookPage>'
              end
            end

            class WebhookContext < InstanceContext
              ##
              # Initialize the WebhookContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the
              #   {Service}[https://www.twilio.com/docs/chat/rest/service-resource] with the
              #   Channel to fetch the Webhook resource from.
              # @param [String] channel_sid The SID of the
              #   {Channel}[https://www.twilio.com/docs/chat/channels] the Channel Webhook
              #   resource to fetch belongs to. This value can be the Channel resource's `sid` or
              #   `unique_name`.
              # @param [String] sid The SID of the Channel Webhook resource to fetch.
              # @return [WebhookContext] WebhookContext
              def initialize(version, service_sid, channel_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, channel_sid: channel_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Webhooks/#{@solution[:sid]}"
              end

              ##
              # Fetch the WebhookInstance
              # @return [WebhookInstance] Fetched WebhookInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                WebhookInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the WebhookInstance
              # @param [String] configuration_url The URL of the webhook to call using the
              #   `configuration.method`.
              # @param [webhook.Method] configuration_method The HTTP method used to call
              #   `configuration.url`. Can be: `GET` or `POST` and the default is `POST`.
              # @param [String] configuration_filters The events that cause us to call the
              #   Channel Webhook. Used when `type` is `webhook`. This parameter takes only one
              #   event. To specify more than one event, repeat this parameter for each event. For
              #   the list of possible events, see {Webhook Event
              #   Triggers}[https://www.twilio.com/docs/chat/webhook-events#webhook-event-trigger].
              # @param [String] configuration_triggers A string that will cause us to call the
              #   webhook when it is present in a message body. This parameter takes only one
              #   trigger string. To specify more than one, repeat this parameter for each trigger
              #   string up to a total of 5 trigger strings. Used only when `type` = `trigger`.
              # @param [String] configuration_flow_sid The SID of the Studio
              #   {Flow}[https://www.twilio.com/docs/studio/rest-api/flow] to call when an event
              #   in `configuration.filters` occurs. Used only when `type` = `studio`.
              # @param [String] configuration_retry_count The number of times to retry the
              #   webhook if the first attempt fails. Can be an integer between 0 and 3,
              #   inclusive, and the default is 0.
              # @return [WebhookInstance] Updated WebhookInstance
              def update(configuration_url: :unset, configuration_method: :unset, configuration_filters: :unset, configuration_triggers: :unset, configuration_flow_sid: :unset, configuration_retry_count: :unset)
                data = Twilio::Values.of({
                    'Configuration.Url' => configuration_url,
                    'Configuration.Method' => configuration_method,
                    'Configuration.Filters' => Twilio.serialize_list(configuration_filters) { |e| e },
                    'Configuration.Triggers' => Twilio.serialize_list(configuration_triggers) { |e| e },
                    'Configuration.FlowSid' => configuration_flow_sid,
                    'Configuration.RetryCount' => configuration_retry_count,
                })

                payload = @version.update('POST', @uri, data: data)

                WebhookInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Delete the WebhookInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                 @version.delete('DELETE', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.IpMessaging.V2.WebhookContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.IpMessaging.V2.WebhookContext #{context}>"
              end
            end

            class WebhookInstance < InstanceResource
              ##
              # Initialize the WebhookInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the
              #   {Service}[https://www.twilio.com/docs/chat/rest/service-resource] the Channel
              #   Webhook resource is associated with.
              # @param [String] channel_sid The SID of the
              #   {Channel}[https://www.twilio.com/docs/chat/channels] the Channel Webhook
              #   resource belongs to.
              # @param [String] sid The SID of the Channel Webhook resource to fetch.
              # @return [WebhookInstance] WebhookInstance
              def initialize(version, payload, service_sid: nil, channel_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'channel_sid' => payload['channel_sid'],
                    'type' => payload['type'],
                    'url' => payload['url'],
                    'configuration' => payload['configuration'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'channel_sid' => channel_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [WebhookContext] WebhookContext for this WebhookInstance
              def context
                unless @instance_context
                  @instance_context = WebhookContext.new(
                      @version,
                      @params['service_sid'],
                      @params['channel_sid'],
                      @params['sid'],
                  )
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
              # @return [String] The SID of the Service that the Channel Webhook resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the Channel the Channel Webhook resource belongs to
              def channel_sid
                @properties['channel_sid']
              end

              ##
              # @return [String] The type of webhook
              def type
                @properties['type']
              end

              ##
              # @return [String] The absolute URL of the Channel Webhook resource
              def url
                @properties['url']
              end

              ##
              # @return [Hash] The JSON string that describes the configuration object for the channel webhook
              def configuration
                @properties['configuration']
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
              # Fetch the WebhookInstance
              # @return [WebhookInstance] Fetched WebhookInstance
              def fetch
                context.fetch
              end

              ##
              # Update the WebhookInstance
              # @param [String] configuration_url The URL of the webhook to call using the
              #   `configuration.method`.
              # @param [webhook.Method] configuration_method The HTTP method used to call
              #   `configuration.url`. Can be: `GET` or `POST` and the default is `POST`.
              # @param [String] configuration_filters The events that cause us to call the
              #   Channel Webhook. Used when `type` is `webhook`. This parameter takes only one
              #   event. To specify more than one event, repeat this parameter for each event. For
              #   the list of possible events, see {Webhook Event
              #   Triggers}[https://www.twilio.com/docs/chat/webhook-events#webhook-event-trigger].
              # @param [String] configuration_triggers A string that will cause us to call the
              #   webhook when it is present in a message body. This parameter takes only one
              #   trigger string. To specify more than one, repeat this parameter for each trigger
              #   string up to a total of 5 trigger strings. Used only when `type` = `trigger`.
              # @param [String] configuration_flow_sid The SID of the Studio
              #   {Flow}[https://www.twilio.com/docs/studio/rest-api/flow] to call when an event
              #   in `configuration.filters` occurs. Used only when `type` = `studio`.
              # @param [String] configuration_retry_count The number of times to retry the
              #   webhook if the first attempt fails. Can be an integer between 0 and 3,
              #   inclusive, and the default is 0.
              # @return [WebhookInstance] Updated WebhookInstance
              def update(configuration_url: :unset, configuration_method: :unset, configuration_filters: :unset, configuration_triggers: :unset, configuration_flow_sid: :unset, configuration_retry_count: :unset)
                context.update(
                    configuration_url: configuration_url,
                    configuration_method: configuration_method,
                    configuration_filters: configuration_filters,
                    configuration_triggers: configuration_triggers,
                    configuration_flow_sid: configuration_flow_sid,
                    configuration_retry_count: configuration_retry_count,
                )
              end

              ##
              # Delete the WebhookInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.IpMessaging.V2.WebhookInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.IpMessaging.V2.WebhookInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end
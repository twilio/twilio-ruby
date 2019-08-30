##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Conversations < Domain
      class V1 < Version
        class ConversationContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class WebhookList < ListResource
            ##
            # Initialize the WebhookList
            # @param [Version] version Version that contains the resource
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this webhook.
            # @return [WebhookList] WebhookList
            def initialize(version, conversation_sid: nil)
              super(version)

              # Path Solution
              @solution = {conversation_sid: conversation_sid}
              @uri = "/Conversations/#{@solution[:conversation_sid]}/Webhooks"
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
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
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
            # Retrieve a single page of WebhookInstance records from the API.
            # Request is executed immediately.
            # @param [webhook.Target] target The target of this webhook: `webhook`, `studio`,
            #   `trigger`
            # @param [String] configuration_url The absolute url the webhook request should be
            #   sent to.
            # @param [webhook.Method] configuration_method The HTTP method to be used when
            #   sending a webhook request.
            # @param [String] configuration_filters The list of events, firing webhook event
            #   for this Conversation.
            # @param [String] configuration_triggers The list of keywords, firing webhook
            #   event for this Conversation.
            # @param [String] configuration_flow_sid The studio flow sid, where the webhook
            #   should be sent to.
            # @param [String] configuration_replay_after The message index for which and it's
            #   successors the webhook will be replayed. Not set by default
            # @return [WebhookInstance] Newly created WebhookInstance
            def create(target: nil, configuration_url: :unset, configuration_method: :unset, configuration_filters: :unset, configuration_triggers: :unset, configuration_flow_sid: :unset, configuration_replay_after: :unset)
              data = Twilio::Values.of({
                  'Target' => target,
                  'Configuration.Url' => configuration_url,
                  'Configuration.Method' => configuration_method,
                  'Configuration.Filters' => Twilio.serialize_list(configuration_filters) { |e| e },
                  'Configuration.Triggers' => Twilio.serialize_list(configuration_triggers) { |e| e },
                  'Configuration.FlowSid' => configuration_flow_sid,
                  'Configuration.ReplayAfter' => configuration_replay_after,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              WebhookInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.WebhookList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
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
              WebhookInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.WebhookPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class WebhookContext < InstanceContext
            ##
            # Initialize the WebhookContext
            # @param [Version] version Version that contains the resource
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this webhook.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [WebhookContext] WebhookContext
            def initialize(version, conversation_sid, sid)
              super(version)

              # Path Solution
              @solution = {conversation_sid: conversation_sid, sid: sid, }
              @uri = "/Conversations/#{@solution[:conversation_sid]}/Webhooks/#{@solution[:sid]}"
            end

            ##
            # Fetch a WebhookInstance
            # @return [WebhookInstance] Fetched WebhookInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              WebhookInstance.new(
                  @version,
                  payload,
                  conversation_sid: @solution[:conversation_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the WebhookInstance
            # @param [String] configuration_url The absolute url the webhook request should be
            #   sent to.
            # @param [webhook.Method] configuration_method The HTTP method to be used when
            #   sending a webhook request.
            # @param [String] configuration_filters The list of events, firing webhook event
            #   for this Conversation.
            # @param [String] configuration_triggers The list of keywords, firing webhook
            #   event for this Conversation.
            # @param [String] configuration_flow_sid The studio flow sid, where the webhook
            #   should be sent to.
            # @return [WebhookInstance] Updated WebhookInstance
            def update(configuration_url: :unset, configuration_method: :unset, configuration_filters: :unset, configuration_triggers: :unset, configuration_flow_sid: :unset)
              data = Twilio::Values.of({
                  'Configuration.Url' => configuration_url,
                  'Configuration.Method' => configuration_method,
                  'Configuration.Filters' => Twilio.serialize_list(configuration_filters) { |e| e },
                  'Configuration.Triggers' => Twilio.serialize_list(configuration_triggers) { |e| e },
                  'Configuration.FlowSid' => configuration_flow_sid,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              WebhookInstance.new(
                  @version,
                  payload,
                  conversation_sid: @solution[:conversation_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the WebhookInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.WebhookContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.WebhookContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class WebhookInstance < InstanceResource
            ##
            # Initialize the WebhookInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this webhook.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [WebhookInstance] WebhookInstance
            def initialize(version, payload, conversation_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'conversation_sid' => payload['conversation_sid'],
                  'target' => payload['target'],
                  'url' => payload['url'],
                  'configuration' => payload['configuration'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
              }

              # Context
              @instance_context = nil
              @params = {'conversation_sid' => conversation_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [WebhookContext] WebhookContext for this WebhookInstance
            def context
              unless @instance_context
                @instance_context = WebhookContext.new(@version, @params['conversation_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The unique id of the Account responsible for this conversation.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique id of the Conversation for this webhook.
            def conversation_sid
              @properties['conversation_sid']
            end

            ##
            # @return [String] The target of this webhook.
            def target
              @properties['target']
            end

            ##
            # @return [String] An absolute URL for this webhook.
            def url
              @properties['url']
            end

            ##
            # @return [Hash] The configuration of this webhook.
            def configuration
              @properties['configuration']
            end

            ##
            # @return [Time] The date that this resource was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this resource was last updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # Fetch a WebhookInstance
            # @return [WebhookInstance] Fetched WebhookInstance
            def fetch
              context.fetch
            end

            ##
            # Update the WebhookInstance
            # @param [String] configuration_url The absolute url the webhook request should be
            #   sent to.
            # @param [webhook.Method] configuration_method The HTTP method to be used when
            #   sending a webhook request.
            # @param [String] configuration_filters The list of events, firing webhook event
            #   for this Conversation.
            # @param [String] configuration_triggers The list of keywords, firing webhook
            #   event for this Conversation.
            # @param [String] configuration_flow_sid The studio flow sid, where the webhook
            #   should be sent to.
            # @return [WebhookInstance] Updated WebhookInstance
            def update(configuration_url: :unset, configuration_method: :unset, configuration_filters: :unset, configuration_triggers: :unset, configuration_flow_sid: :unset)
              context.update(
                  configuration_url: configuration_url,
                  configuration_method: configuration_method,
                  configuration_filters: configuration_filters,
                  configuration_triggers: configuration_triggers,
                  configuration_flow_sid: configuration_flow_sid,
              )
            end

            ##
            # Deletes the WebhookInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.WebhookInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.WebhookInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
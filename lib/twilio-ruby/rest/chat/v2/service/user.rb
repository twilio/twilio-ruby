##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Chat < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class UserList < ListResource
            ##
            # Initialize the UserList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) the User
            #   resource is associated with.
            # @return [UserList] UserList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Users"
            end

            ##
            # Create the UserInstance
            # @param [String] identity The `identity` value that uniquely identifies the new
            #   resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within
            #   the [Service](https://www.twilio.com/docs/chat/rest/service-resource). This
            #   value is often a username or email address. See the Identity documentation for
            #   more info.
            # @param [String] role_sid The SID of the
            #   [Role](https://www.twilio.com/docs/chat/rest/role-resource) to assign to the new
            #   User.
            # @param [String] attributes A valid JSON string that contains
            #   application-specific data.
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the new resource. This value is often used for display purposes.
            # @param [user.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [UserInstance] Created UserInstance
            def create(identity: nil, role_sid: :unset, attributes: :unset, friendly_name: :unset, x_twilio_webhook_enabled: :unset)
              data = Twilio::Values.of({
                  'Identity' => identity,
                  'RoleSid' => role_sid,
                  'Attributes' => attributes,
                  'FriendlyName' => friendly_name,
              })
              headers = Twilio::Values.of({'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })

              payload = @version.create('POST', @uri, data: data, headers: headers)

              UserInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Lists UserInstance records from the API as a list.
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
            # Streams UserInstance records from the API as an Enumerable.
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
            # When passed a block, yields UserInstance records from the API.
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
            # Retrieve a single page of UserInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of UserInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params)

              UserPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of UserInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of UserInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              UserPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Chat.V2.UserList>'
            end
          end

          class UserPage < Page
            ##
            # Initialize the UserPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [UserPage] UserPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of UserInstance
            # @param [Hash] payload Payload response from the API
            # @return [UserInstance] UserInstance
            def get_instance(payload)
              UserInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Chat.V2.UserPage>'
            end
          end

          class UserContext < InstanceContext
            ##
            # Initialize the UserContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) to fetch the
            #   User resource from.
            # @param [String] sid The SID of the User resource to fetch. This value can be
            #   either the `sid` or the `identity` of the User resource to fetch.
            # @return [UserContext] UserContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:sid]}"

              # Dependents
              @user_channels = nil
              @user_bindings = nil
            end

            ##
            # Fetch the UserInstance
            # @return [UserInstance] Fetched UserInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              UserInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Delete the UserInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Update the UserInstance
            # @param [String] role_sid The SID of the
            #   [Role](https://www.twilio.com/docs/chat/rest/role-resource) to assign to the
            #   User.
            # @param [String] attributes A valid JSON string that contains
            #   application-specific data.
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the resource. It is often used for display purposes.
            # @param [user.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [UserInstance] Updated UserInstance
            def update(role_sid: :unset, attributes: :unset, friendly_name: :unset, x_twilio_webhook_enabled: :unset)
              data = Twilio::Values.of({
                  'RoleSid' => role_sid,
                  'Attributes' => attributes,
                  'FriendlyName' => friendly_name,
              })
              headers = Twilio::Values.of({'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })

              payload = @version.update('POST', @uri, data: data, headers: headers)

              UserInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Access the user_channels
            # @return [UserChannelList]
            # @return [UserChannelContext] if channel_sid was passed.
            def user_channels(channel_sid=:unset)
              raise ArgumentError, 'channel_sid cannot be nil' if channel_sid.nil?

              if channel_sid != :unset
                return UserChannelContext.new(@version, @solution[:service_sid], @solution[:sid], channel_sid, )
              end

              unless @user_channels
                @user_channels = UserChannelList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    user_sid: @solution[:sid],
                )
              end

              @user_channels
            end

            ##
            # Access the user_bindings
            # @return [UserBindingList]
            # @return [UserBindingContext] if sid was passed.
            def user_bindings(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return UserBindingContext.new(@version, @solution[:service_sid], @solution[:sid], sid, )
              end

              unless @user_bindings
                @user_bindings = UserBindingList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    user_sid: @solution[:sid],
                )
              end

              @user_bindings
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Chat.V2.UserContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Chat.V2.UserContext #{context}>"
            end
          end

          class UserInstance < InstanceResource
            ##
            # Initialize the UserInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) the User
            #   resource is associated with.
            # @param [String] sid The SID of the User resource to fetch. This value can be
            #   either the `sid` or the `identity` of the User resource to fetch.
            # @return [UserInstance] UserInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'attributes' => payload['attributes'],
                  'friendly_name' => payload['friendly_name'],
                  'role_sid' => payload['role_sid'],
                  'identity' => payload['identity'],
                  'is_online' => payload['is_online'],
                  'is_notifiable' => payload['is_notifiable'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'joined_channels_count' => payload['joined_channels_count'].to_i,
                  'links' => payload['links'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [UserContext] UserContext for this UserInstance
            def context
              unless @instance_context
                @instance_context = UserContext.new(@version, @params['service_sid'], @params['sid'], )
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
            # @return [String] The SID of the Service that the resource is associated with
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The JSON string that stores application-specific data
            def attributes
              @properties['attributes']
            end

            ##
            # @return [String] The string that you assigned to describe the resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The SID of the Role assigned to the user
            def role_sid
              @properties['role_sid']
            end

            ##
            # @return [String] The string that identifies the resource's User
            def identity
              @properties['identity']
            end

            ##
            # @return [Boolean] Whether the User is actively connected to the Service instance and online
            def is_online
              @properties['is_online']
            end

            ##
            # @return [Boolean] Whether the User has a potentially valid Push Notification registration for the Service instance
            def is_notifiable
              @properties['is_notifiable']
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
            # @return [String] The number of Channels the User is a Member of
            def joined_channels_count
              @properties['joined_channels_count']
            end

            ##
            # @return [String] The absolute URLs of the Channel and Binding resources related to the user
            def links
              @properties['links']
            end

            ##
            # @return [String] The absolute URL of the User resource
            def url
              @properties['url']
            end

            ##
            # Fetch the UserInstance
            # @return [UserInstance] Fetched UserInstance
            def fetch
              context.fetch
            end

            ##
            # Delete the UserInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Update the UserInstance
            # @param [String] role_sid The SID of the
            #   [Role](https://www.twilio.com/docs/chat/rest/role-resource) to assign to the
            #   User.
            # @param [String] attributes A valid JSON string that contains
            #   application-specific data.
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the resource. It is often used for display purposes.
            # @param [user.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [UserInstance] Updated UserInstance
            def update(role_sid: :unset, attributes: :unset, friendly_name: :unset, x_twilio_webhook_enabled: :unset)
              context.update(
                  role_sid: role_sid,
                  attributes: attributes,
                  friendly_name: friendly_name,
                  x_twilio_webhook_enabled: x_twilio_webhook_enabled,
              )
            end

            ##
            # Access the user_channels
            # @return [user_channels] user_channels
            def user_channels
              context.user_channels
            end

            ##
            # Access the user_bindings
            # @return [user_bindings] user_bindings
            def user_bindings
              context.user_bindings
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Chat.V2.UserInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Chat.V2.UserInstance #{values}>"
            end
          end
        end
      end
    end
  end
end
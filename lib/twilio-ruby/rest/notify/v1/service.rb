##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Notify < Domain
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
          # @param [String] apn_credential_sid The apn_credential_sid
          # @param [String] gcm_credential_sid The gcm_credential_sid
          # @param [String] messaging_service_sid The messaging_service_sid
          # @param [String] facebook_messenger_page_id The facebook_messenger_page_id
          # @param [String] default_apn_notification_protocol_version The
          #   default_apn_notification_protocol_version
          # @param [String] default_gcm_notification_protocol_version The
          #   default_gcm_notification_protocol_version
          # @param [String] fcm_credential_sid The fcm_credential_sid
          # @param [String] default_fcm_notification_protocol_version The
          #   default_fcm_notification_protocol_version
          # @param [Boolean] log_enabled The log_enabled
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(friendly_name: Twilio::Values::Unset, apn_credential_sid: Twilio::Values::Unset, gcm_credential_sid: Twilio::Values::Unset, messaging_service_sid: Twilio::Values::Unset, facebook_messenger_page_id: Twilio::Values::Unset, default_apn_notification_protocol_version: Twilio::Values::Unset, default_gcm_notification_protocol_version: Twilio::Values::Unset, fcm_credential_sid: Twilio::Values::Unset, default_fcm_notification_protocol_version: Twilio::Values::Unset, log_enabled: Twilio::Values::Unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'ApnCredentialSid' => apn_credential_sid,
                'GcmCredentialSid' => gcm_credential_sid,
                'MessagingServiceSid' => messaging_service_sid,
                'FacebookMessengerPageId' => facebook_messenger_page_id,
                'DefaultApnNotificationProtocolVersion' => default_apn_notification_protocol_version,
                'DefaultGcmNotificationProtocolVersion' => default_gcm_notification_protocol_version,
                'FcmCredentialSid' => fcm_credential_sid,
                'DefaultFcmNotificationProtocolVersion' => default_fcm_notification_protocol_version,
                'LogEnabled' => log_enabled,
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
          # @param [String] friendly_name The friendly_name
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(friendly_name: Twilio::Values::Unset, limit: nil, page_size: nil)
            self.stream(
                friendly_name: friendly_name,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams ServiceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name The friendly_name
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(friendly_name: Twilio::Values::Unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                friendly_name: friendly_name,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields ServiceInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name The friendly_name
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
          # @param [String] friendly_name The friendly_name
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(friendly_name: Twilio::Values::Unset, page_token: Twilio::Values::Unset, page_number: Twilio::Values::Unset, page_size: Twilio::Values.Unset)
            params = Twilio::Values.of({
                'FriendlyName' => friendly_name,
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
            '#<Twilio.Notify.V1.ServiceList>'
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
            '<Twilio.Notify.V1.ServicePage>'
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
            @bindings = nil
            @notifications = nil
            @users = nil
            @segments = nil
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            return @version.delete('delete', @uri)
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
          # Update the ServiceInstance
          # @param [String] friendly_name The friendly_name
          # @param [String] apn_credential_sid The apn_credential_sid
          # @param [String] gcm_credential_sid The gcm_credential_sid
          # @param [String] messaging_service_sid The messaging_service_sid
          # @param [String] facebook_messenger_page_id The facebook_messenger_page_id
          # @param [String] default_apn_notification_protocol_version The
          #   default_apn_notification_protocol_version
          # @param [String] default_gcm_notification_protocol_version The
          #   default_gcm_notification_protocol_version
          # @param [String] fcm_credential_sid The fcm_credential_sid
          # @param [String] default_fcm_notification_protocol_version The
          #   default_fcm_notification_protocol_version
          # @param [Boolean] log_enabled The log_enabled
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: Twilio::Values::Unset, apn_credential_sid: Twilio::Values::Unset, gcm_credential_sid: Twilio::Values::Unset, messaging_service_sid: Twilio::Values::Unset, facebook_messenger_page_id: Twilio::Values::Unset, default_apn_notification_protocol_version: Twilio::Values::Unset, default_gcm_notification_protocol_version: Twilio::Values::Unset, fcm_credential_sid: Twilio::Values::Unset, default_fcm_notification_protocol_version: Twilio::Values::Unset, log_enabled: Twilio::Values::Unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'ApnCredentialSid' => apn_credential_sid,
                'GcmCredentialSid' => gcm_credential_sid,
                'MessagingServiceSid' => messaging_service_sid,
                'FacebookMessengerPageId' => facebook_messenger_page_id,
                'DefaultApnNotificationProtocolVersion' => default_apn_notification_protocol_version,
                'DefaultGcmNotificationProtocolVersion' => default_gcm_notification_protocol_version,
                'FcmCredentialSid' => fcm_credential_sid,
                'DefaultFcmNotificationProtocolVersion' => default_fcm_notification_protocol_version,
                'LogEnabled' => log_enabled,
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
          # Access the bindings
          # @return [BindingList] BindingList
          def bindings(sid=:unset)
            if sid != :unset
              return BindingContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end

            unless @bindings
              @bindings = BindingList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @bindings
          end

          ##
          # Access the notifications
          # @return [NotificationList] NotificationList
          def notifications
            unless @notifications
              @notifications = NotificationList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @notifications
          end

          ##
          # Access the users
          # @return [UserList] UserList
          def users(identity=:unset)
            if identity != :unset
              return UserContext.new(
                  @version,
                  @solution[:sid],
                  identity,
              )
            end

            unless @users
              @users = UserList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @users
          end

          ##
          # Access the segments
          # @return [SegmentList] SegmentList
          def segments
            unless @segments
              @segments = SegmentList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end

            @segments
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Notify.V1.ServiceContext #{context}>"
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
                'apn_credential_sid' => payload['apn_credential_sid'],
                'gcm_credential_sid' => payload['gcm_credential_sid'],
                'fcm_credential_sid' => payload['fcm_credential_sid'],
                'messaging_service_sid' => payload['messaging_service_sid'],
                'facebook_messenger_page_id' => payload['facebook_messenger_page_id'],
                'default_apn_notification_protocol_version' => payload['default_apn_notification_protocol_version'],
                'default_gcm_notification_protocol_version' => payload['default_gcm_notification_protocol_version'],
                'default_fcm_notification_protocol_version' => payload['default_fcm_notification_protocol_version'],
                'log_enabled' => payload['log_enabled'],
                'url' => payload['url'],
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

          def apn_credential_sid
            @properties['apn_credential_sid']
          end

          def gcm_credential_sid
            @properties['gcm_credential_sid']
          end

          def fcm_credential_sid
            @properties['fcm_credential_sid']
          end

          def messaging_service_sid
            @properties['messaging_service_sid']
          end

          def facebook_messenger_page_id
            @properties['facebook_messenger_page_id']
          end

          def default_apn_notification_protocol_version
            @properties['default_apn_notification_protocol_version']
          end

          def default_gcm_notification_protocol_version
            @properties['default_gcm_notification_protocol_version']
          end

          def default_fcm_notification_protocol_version
            @properties['default_fcm_notification_protocol_version']
          end

          def log_enabled
            @properties['log_enabled']
          end

          def url
            @properties['url']
          end

          def links
            @properties['links']
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Update the ServiceInstance
          # @param [String] friendly_name The friendly_name
          # @param [String] apn_credential_sid The apn_credential_sid
          # @param [String] gcm_credential_sid The gcm_credential_sid
          # @param [String] messaging_service_sid The messaging_service_sid
          # @param [String] facebook_messenger_page_id The facebook_messenger_page_id
          # @param [String] default_apn_notification_protocol_version The
          #   default_apn_notification_protocol_version
          # @param [String] default_gcm_notification_protocol_version The
          #   default_gcm_notification_protocol_version
          # @param [String] fcm_credential_sid The fcm_credential_sid
          # @param [String] default_fcm_notification_protocol_version The
          #   default_fcm_notification_protocol_version
          # @param [Boolean] log_enabled The log_enabled
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: Twilio::Values::Unset, apn_credential_sid: Twilio::Values::Unset, gcm_credential_sid: Twilio::Values::Unset, messaging_service_sid: Twilio::Values::Unset, facebook_messenger_page_id: Twilio::Values::Unset, default_apn_notification_protocol_version: Twilio::Values::Unset, default_gcm_notification_protocol_version: Twilio::Values::Unset, fcm_credential_sid: Twilio::Values::Unset, default_fcm_notification_protocol_version: Twilio::Values::Unset, log_enabled: Twilio::Values::Unset)
            context.update(
                friendly_name: friendly_name,
                apn_credential_sid: apn_credential_sid,
                gcm_credential_sid: gcm_credential_sid,
                messaging_service_sid: messaging_service_sid,
                facebook_messenger_page_id: facebook_messenger_page_id,
                default_apn_notification_protocol_version: default_apn_notification_protocol_version,
                default_gcm_notification_protocol_version: default_gcm_notification_protocol_version,
                fcm_credential_sid: fcm_credential_sid,
                default_fcm_notification_protocol_version: default_fcm_notification_protocol_version,
                log_enabled: log_enabled,
            )
          end

          ##
          # Access the bindings
          # @return [bindings] bindings
          def bindings
            context.bindings
          end

          ##
          # Access the notifications
          # @return [notifications] notifications
          def notifications
            context.notifications
          end

          ##
          # Access the users
          # @return [users] users
          def users
            context.users
          end

          ##
          # Access the segments
          # @return [segments] segments
          def segments
            context.segments
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Notify.V1.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end
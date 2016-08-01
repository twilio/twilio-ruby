module Twilio
  module JWT
    class TaskRouterCapability
      TASK_ROUTER_BASE_URL = 'https://taskrouter.twilio.com'
      TASK_ROUTER_VERSION = 'v1'
      TASK_ROUTER_WEBSOCKET_BASE_URL = 'https://event-bridge.twilio.com/v1/wschannels'

      REQUIRED = {required: true}
      OPTIONAL = {required: false}

      def initialize(account_sid, auth_token, workspace_sid, channel_id)
        @account_sid = account_sid
        @auth_token = auth_token
        @policies = []

        @workspace_sid = workspace_sid
        @channel_id = channel_id

        @base_url = "#{TASK_ROUTER_BASE_URL}/#{TASK_ROUTER_VERSION}/Workspaces/#{workspace_sid}"

        validate_jwt

        setup_resource

        allow_websocket_requests(@channel_id)
        allow(@resource_url, 'GET')
      end

      def allow_fetch_subresources
        allow(@resource_url + '/**', 'GET')
      end

      def allow_updates
        allow(@resource_url, 'POST')
      end

      def allow_updates_subresources
        allow(@resource_url + '/**', 'POST')
      end

      def allow_delete
        allow(@resource_url, 'DELETE')
      end

      def allow_delete_subresources
        allow(@resource_url + '/**', 'DELETE')
      end

      def add_policy(url, method, allowed = true, query_filters = nil, post_filters = nil)
        policy = {
            url: url,
            method: method,
            query_filter: query_filters || {},
            post_filter: post_filters || {},
            allow: allowed
        }

        @policies.push(policy)
      end

      def allow(url, method, query_filters = nil, post_filters = nil)
        add_policy(url, method, true, query_filters, post_filters)
      end

      def deny(url, method, query_filters = nil, post_filters = nil)
        add_policy(url, method, false, query_filters, post_filters)
      end

      def generate_token(ttl = 3600)
        task_router_attributes = {
            account_sid: @account_sid,
            workspace_sid: @workspace_sid,
            channel: @channel_id
        }

        if @channel_id[0..1] == 'WK'
          task_router_attributes[:worker_sid] = @channel_id
        elsif @channel_id[0..1] == 'WQ'
          task_router_attributes[:taskqueue_sid] = @channel_id
        end

        generate_token_protected(ttl, task_router_attributes)
      end

      protected

      def generate_token_protected(ttl = 3600, extra_attributes)
        payload = {
            iss: @account_sid,
            exp: (Time.now.to_i + ttl),
            version: TASK_ROUTER_VERSION,
            friendly_name: @channel_id,
            policies: @policies,
        }
        extra_attributes.each { |key, value|
          payload[key] = value
        }

        ::JWT.encode payload, @auth_token
      end

      def setup_resource
        if @channel_id[0..1] == 'WS'
          @resource_url = @base_url
        elsif @channel_id[0..1] == 'WK'
          @resource_url = @base_url + '/Workers/' + @channel_id

          @activity_url = @base_url + '/Activities'
          allow(@activity_url, 'GET')

          @tasks_url = @base_url + '/Tasks/**'
          allow(@tasks_url, 'GET')

          @worker_reservations_url = @resource_url + '/Reservations/**'
          allow(@worker_reservations_url, 'GET')

        elsif @channel_id[0..1] == 'WQ'
          @resource_url = @base_url + '/TaskQueues/' + @channel_id
        end
      end

      def allow_websocket_requests(channel_id)
        worker_url = "#{TASK_ROUTER_WEBSOCKET_BASE_URL}/#{@account_sid}/#{channel_id}"
        ['GET', 'POST'].each do |meth|
          add_policy(worker_url, meth)
        end
      end

      def validate_jwt
        if @account_sid.nil? or @account_sid[0..1] != 'AC'
          raise "Invalid AccountSid provided #{@account_sid}"
        end
        if @workspace_sid.nil? or @workspace_sid[0..1] != 'WS'
          raise "Invalid WorkspaceSid provided #{@workspace_sid}"
        end
        if @channel_id.nil?
          raise 'ChannelId not provided'
        end
        @prefix = @channel_id[0..1]
        if @prefix != 'WS' and @prefix != 'WK' and @prefix != 'WQ'
          raise "Invalid ChannelId provided: #{@channel_id}"
        end
      end
    end

    class WorkerCapability < TaskRouterCapability

      def initialize(account_sid, auth_token, workspace_sid, worker_sid)
        super(account_sid, auth_token, workspace_sid, worker_sid)
        @tasks_url = @base_url + '/Tasks/**'
        @activity_url = @base_url + '/Activities'
        @worker_reservations_url = @resource_url + '/Reservations/**'

        allow(@activity_url, 'GET')
        allow(@tasks_url, 'GET')
        allow(@worker_reservations_url, 'GET')
      end

      def allow_activity_updates
        allow(@resource_url, 'POST', nil, {ActivitySid: REQUIRED})
      end

      def allow_reservation_updates
        allow(@tasks_url, 'POST', nil, nil)
        allow(@worker_reservations_url, 'POST', nil, nil)
      end

      protected

      def setup_resource
        @resource_url = @base_url + '/Workers/' + @channel_id
      end

    end

    class WorkspaceCapability < TaskRouterCapability

      def initialize(account_sid, auth_token, workspace_sid)
        super(account_sid, auth_token, workspace_sid, workspace_sid)
      end

      protected

      def setup_resource
        @resource_url = @base_url
      end

    end

    class TaskQueueCapability < TaskRouterCapability

      def initialize(account_sid, auth_token, workspace_sid, taskqueue_sid)
        super(account_sid, auth_token, workspace_sid, taskqueue_sid)
      end

      protected

      def setup_resource
        @resource_url = @base_url + '/TaskQueues/' + @channel_id
      end
    end
  end
end
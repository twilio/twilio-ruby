module Twilio
  module JWT
    class TaskRouterCapability < BaseJWT
      TASK_ROUTER_VERSION = 'v1'
      TASK_ROUTER_BASE_URL = 'https://taskrouter.twilio.com'
      TASK_ROUTER_WEBSOCKET_BASE_URL = 'https://event-bridge.twilio.com/v1/wschannels'

      def initialize(account_sid, auth_token, workspace_sid: nil, channel_id: nil, **optionals)
        super(secret_key: auth_token,
              issuer: account_sid,
              algorithm: 'HS256',
              nbf: optionals['nbf'],
              ttl: optionals['ttl'] || 3600,
              valid_until: optionals['valid_until']
        )
        @account_sid = account_sid
        @auth_token = auth_token
        @workspace_sid = workspace_sid
        @channel_id = channel_id
        @policies = []

        _validate_input

        self.allow_websockets(@channel_id)
        self.allow_fetch
        self.allow_updates if optionals.key?(:allow_updates)
        self.allow_delete if optionals.key?(:allow_delete)
        self.allow_fetch_subresources if optionals.key?(:allow_fetch_subresources)
        self.allow_update_subresources if optionals.key?(:allow_update_subresources)
        self.allow_delete_subresources if optionals.key?(:allow_delete_subresources)
      end

      def allow_fetch
        self.add_policy(self.resource_url, 'GET', true)
      end

      def allow_updates
        self.add_policy(self.resource_url, 'POST', true)
      end

      def allow_delete
        self.add_policy(self.resource_url, 'DELETE', true)
      end

      def allow_fetch_subresources
        self.add_policy(self.resource_url + '/**', 'GET', true)
      end

      def allow_updates_subresources
        self.add_policy(self.resource_url + '/**', 'POST', true)
      end

      def allow_delete_subresources
        self.add_policy(self.resource_url + '/**', 'DELETE', true)
      end

      def allow_websockets(channel_id=nil)
        channel_id = channel_id || @channel_id
        worker_url = "#{TASK_ROUTER_WEBSOCKET_BASE_URL}/#{@account_sid}/#{channel_id}"
        ['GET', 'POST'].each do |meth|
          add_policy(worker_url, meth)
        end
      end

      def workspace_url
        return "#{TASK_ROUTER_BASE_URL}/#{TASK_ROUTER_VERSION}/Workspaces/#{@workspace_sid}"
      end

      def resource_url
        fail NotImplementedError, "Resource URL must be specified by subclass"
      end

      def channel_prefix
        fail NotImplementedError, "Channel Prefix must be specified by subclass"
      end

      def add_policy(url, method, allowed = true, query_filters: nil, post_filters: nil)
        policy = {
            url: url,
            method: method,
            query_filter: query_filters || {},
            post_filter: post_filters || {},
            allow: allowed
        }

        @policies.push(policy)
      end

      def to_s
        to_jwt
      end

      protected
      def _generate_payload
        payload = {
            account_sid: @account_sid,
            workspace_sid: @workspace_sid,
            channel: @channel_id,
            version: TASK_ROUTER_VERSION,
            friendly_name: @channel_id,
            policies: @policies
        }

        if @channel_id[0..1] == 'WK'
          payload[:worker_sid] = @channel_id
        elsif @channel_id[0..1] == 'WQ'
          payload[:taskqueue_sid] = @channel_id
        end

        return payload
      end

      private
      def _validate_input
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
        if @prefix != self.channel_prefix
          raise "Invalid ChannelId provided: #{@channel_id}"
        end
      end
    end

    class WorkerCapability < TaskRouterCapability

      def initialize(account_sid, auth_token, workspace_sid, worker_sid, **optionals)
        super(account_sid, auth_token, workspace_sid: workspace_sid, channel_id: worker_sid, **optionals)

        self.allow_fetch_tasks
        self.allow_fetch_activities
        self.allow_fetch_worker_reservations
        self.allow_update_activities if optionals[:allow_update_activities]
        self.allow_update_worker_reservations if optionals[:allow_update_worker_reservations]
      end

      def allow_fetch_tasks
        self.add_policy(self.workspace_url + '/Tasks/**', 'GET', true)
      end

      def allow_fetch_activities
        self.add_policy(self.workspace_url + '/Activities', 'GET', true)
      end

      def allow_fetch_worker_reservations
        self.add_policy(self.resource_url + '/Reservations/**', 'GET', true)
      end

      def allow_update_activities
        post_filter = {ActivitySid: {required: true}}
        self.add_policy(self.workspace_url + '/Activities', 'POST', true, post_filters: post_filter)
      end

      def allow_update_worker_reservations
        self.add_policy(self.workspace_url + '/Tasks/**', 'POST', true)
        self.add_policy(self.resource_url + '/Reservations/**', 'POST', true)
      end

      def resource_url
        return self.workspace_url + '/Workers/' + @channel_id
      end

      def channel_prefix
        return 'WK'
      end

      def to_s
        return self.to_jwt
      end
    end

    class TaskQueueCapability < TaskRouterCapability

      def initialize(account_sid, auth_token, workspace_sid, taskqueue_sid, **optionals)
        super(account_sid, auth_token, workspace_sid: workspace_sid, channel_id: taskqueue_sid, **optionals)
      end

      def resource_url
        return self.workspace_url + '/TaskQueues/' + @channel_id
      end

      def channel_prefix
        return 'WQ'
      end

      def to_s
        return self.to_jwt
      end
    end

    class WorkspaceCapability < TaskRouterCapability

      def initialize(account_sid, auth_token, workspace_sid, **optionals)
        super(account_sid, auth_token, workspace_sid: workspace_sid, channel_id: workspace_sid, ttl: 3600, **optionals)
      end

      def resource_url
        return self.workspace_url
      end

      def channel_prefix
        return 'WS'
      end

      def to_s
        return self.to_jwt
      end

    end
  end
end
module Twilio
  module TaskRouter
    class Capability

      TASK_ROUTER_BASE_URL = 'https://taskrouter.twilio.com'
      TASK_ROUTER_VERSION = 'v1'
      TASK_ROUTER_WEBSOCKET_BASE_URL = 'https://event-bridge.twilio.com/v1/wschannels'

      REQUIRED = {required: true}
      OPTIONAL = {required: false}

      def initialize(account_sid, auth_token, workspace_sid, worker_sid)
        @account_sid = account_sid
        @auth_token = auth_token
        @workspace_sid = workspace_sid
        @worker_sid = worker_sid
        @policies = []
        allow_websocket_requests
        allow_activity_list_fetch
      end

      def workspace_url
        "#{TASK_ROUTER_BASE_URL}/#{TASK_ROUTER_VERSION}/Workspaces/#{@workspace_sid}"
      end

      def worker_url
        "#{workspace_url}/Workers/#{@worker_sid}"
      end

      def allow_worker_activity_updates
        add_policy(worker_url, "POST", nil, {ActivitySid: REQUIRED})
      end

      def allow_worker_fetch_attributes
        add_policy(worker_url, "GET")
      end

      def allow_task_reservation_updates
        task_url = "#{workspace_url}/Tasks/**"
        add_policy(task_url, "POST", nil, {ReservationStatus: REQUIRED})
      end

      def add_policy(url, method, query_filters = nil, post_filters = nil, allowed = true)
        policy = {
          url: url,
          method: method,
          query_filter: query_filters || {},
          post_filter: post_filters || {},
          allow: allowed
        }

        @policies.push(policy)
      end

      def generate_token(ttl = 3600)
        payload = {
          iss: @account_sid,
          exp: (Time.now.to_i + ttl),
          version: @version,
          friendly_name: @worker_sid,
          policies: @policies,
          account_sid: @account_sid,
          worker_sid: @worker_sid,
          channel: @worker_sid,
          workspace_sid: @workspace_sid
        }

        JWT.encode payload, @auth_token
      end

      protected

      def allow_websocket_requests
        worker_url = "#{TASK_ROUTER_WEBSOCKET_BASE_URL}/#{@account_sid}/#{@worker_sid}"
        ['GET', 'POST'].each do |meth|
          add_policy(worker_url, meth)
        end
      end

      def allow_activity_list_fetch
        url = "#{workspace_url}/Activities"
        add_policy(url, 'GET')
      end

    end
  end
end

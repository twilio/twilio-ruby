module Twilio
  module JWT
    ## A JWT for TaskRouter with set capabilities
    class TaskRouterCapability < BaseJWT
      TASK_ROUTER_VERSION = 'v1'.freeze
      # @param [String] account_sid The account_sid for which the token is generated
      # @param [String] auth_token The secret_key to sign the token
      # @param [String] workspace_sid TaskRouter workspace sid
      # @param [String] channel_id TaskRouter channel sid
      # @param [String] nbf The epoch time in seconds before which the token is valid.
      # @param [String] ttl Time to live in seconds for which the JWT is valid, default one hour (3600)
      # @param [String] valid_until The epoch time in seconds for which the JWT is valid , overrides ttl if specified
      def initialize(account_sid, auth_token, workspace_sid, channel_id, nbf: nil, ttl: 3600, valid_until: nil)
        super(secret_key: auth_token,
              issuer: account_sid,
              nbf: nbf,
              ttl: ttl,
              valid_until: valid_until
        )
        @account_sid = account_sid
        @auth_token = auth_token
        @workspace_sid = workspace_sid
        @channel_id = channel_id
        @policies = []
      end

      # Adds a Policy to the TaskRouter Token
      # @param[Policy] policy Policy to be added to the JWT
      def add_policy(policy)
        @policies.push(policy)
      end

      def to_s
        to_jwt
      end

      protected

      def _generate_payload
        Twilio::JWT::TaskRouterCapability::TaskRouterUtils
          .web_socket_policies(@account_sid, @channel_id)
          .each { |policy| add_policy(policy) }
        policies = @policies.map(&:_generate_payload)

        payload = {
          account_sid: @account_sid,
          workspace_sid: @workspace_sid,
          channel: @channel_id,
          version: TASK_ROUTER_VERSION,
          friendly_name: @channel_id,
          policies: policies
        }

        if @channel_id[0..1] == 'WK'
          payload[:worker_sid] = @channel_id
        elsif @channel_id[0..1] == 'WQ'
          payload[:taskqueue_sid] = @channel_id
        end

        payload
      end

      ## Representation of an Access policy rule, which defines what resource can be accessed
      # and with what parameters
      class Policy
        attr_accessor :url,
                      :method,
                      :allowed,
                      :post_filters,
                      :query_filters

        # @param [String] url The URL of the resource
        # @param [String] method The HTTP method
        # @param [String] allowed Does this rule allow access?
        # @param [Hash] post_filters form encoded parameters and values that must match,
        # if undefined all parameters and values match
        # @param [Hash] query_filters query_parameters and values that must match,
        # if undefined all parameters and values match
        def initialize(url, method, allowed, post_filters = {}, query_filters = {})
          @url = url
          @method = method
          @allowed = allowed
          @post_filters = post_filters
          @query_filters = query_filters
        end

        def _generate_payload
          policy = {
            url: @url,
            method: @method,
            query_filter: @query_filters,
            post_filter: @post_filters,
            allow: @allowed
          }
          policy
        end
      end

      class TaskRouterUtils
        TASK_ROUTER_VERSION = 'v1'.freeze
        TASK_ROUTER_BASE_URL = 'https://taskrouter.twilio.com'.freeze
        TASK_ROUTER_WEBSOCKET_BASE_URL = 'https://event-bridge.twilio.com/v1/wschannels'.freeze

        def self.workspaces
          [TASK_ROUTER_BASE_URL, TASK_ROUTER_VERSION, 'Workspaces'].join('/')
        end

        def self.workspace(worskspace_sid)
          [TASK_ROUTER_BASE_URL, TASK_ROUTER_VERSION, 'Workspaces', worskspace_sid].join('/')
        end

        def self.all_workspaces
          [TASK_ROUTER_BASE_URL, TASK_ROUTER_VERSION, 'Workspaces', '**'].join('/')
        end

        def self.tasks(workspace_sid)
          [workspace(workspace_sid), 'Tasks'].join('/')
        end

        def self.task(workspace_sid, tasks_sid)
          [workspace(workspace_sid), 'Tasks', tasks_sid].join('/')
        end

        def self.all_tasks(workspace_sid)
          [workspace(workspace_sid), 'Tasks', '**'].join('/')
        end

        def self.task_queues(workspace_sid)
          [workspace(workspace_sid), 'TaskQueues'].join('/')
        end

        def self.task_queue(workspace_sid, taskqueue_sid)
          [workspace(workspace_sid), 'TaskQueues', taskqueue_sid].join('/')
        end

        def self.all_task_queues(workspace_sid)
          [workspace(workspace_sid), 'TaskQueues', '**'].join('/')
        end

        def self.activities(workspace_sid)
          [workspace(workspace_sid), 'Activities'].join('/')
        end

        def self.activity(workspace_sid, activity_sid)
          [workspace(workspace_sid), 'Activities', activity_sid].join('/')
        end

        def self.all_activities(workspace_sid)
          [workspace(workspace_sid), 'Activities', '**'].join('/')
        end

        def self.workers(workspace_sid)
          [workspace(workspace_sid), 'Workers'].join('/')
        end

        def self.worker(workspace_sid, worker_sid)
          [workspace(workspace_sid), 'Workers', worker_sid].join('/')
        end

        def self.all_workers(workspace_sid)
          [workspace(workspace_sid), 'Workers', '**'].join('/')
        end

        def self.reservations(workspace_sid, worker_sid)
          [worker(workspace_sid, worker_sid), 'Reservations'].join('/')
        end

        def self.reservation(workspace_sid, worker_sid, reservation_sid)
          [worker(workspace_sid, worker_sid), 'Reservations', reservation_sid].join('/')
        end

        def self.all_reservations(workspace_sid, worker_sid)
          [worker(workspace_sid, worker_sid), 'Reservations', '**'].join('/')
        end

        def self.web_socket_policies(account_sid, channel_sid)
          url = [TASK_ROUTER_WEBSOCKET_BASE_URL, account_sid, channel_sid].join('/')
          get = Policy.new(url, 'GET', true)
          post = Policy.new(url, 'POST', true)
          [get, post]
        end

        def self.worker_policies(workspace_sid, worker_sid)
          activities = Policy.new(self.activities(workspace_sid), 'GET', true)
          tasks = Policy.new(all_tasks(workspace_sid), 'GET', true)
          reservations = Policy.new(all_reservations(workspace_sid, worker_sid), 'GET', true)
          fetch = Policy.new(worker(workspace_sid, worker_sid), 'GET', true)
          [activities, tasks, reservations, fetch]
        end
      end
    end
  end
end

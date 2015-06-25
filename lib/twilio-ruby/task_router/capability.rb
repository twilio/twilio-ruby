module Twilio
  module TaskRouter
    class CapabilityAPI
      def initialize(account_sid, auth_token, version, friendly_name)
        @account_sid = account_sid
        @auth_token = auth_token
        @version = version
        @friendly_name = friendly_name
        @policies = []
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

      def generate_token(ttl = 3600, extraAttributes)
        payload = {
            iss: @account_sid,
            exp: (Time.now.to_i + ttl),
            version: @version,
            friendly_name: @worker_sid,
            policies: @policies,
        }
        extraAttributes.each { |key, value|
          payload[key] = value
        }

        JWT.encode payload, @auth_token
      end
    end
    class Capability < CapabilityAPI
      TASK_ROUTER_BASE_URL = 'https://taskrouter.twilio.com'
      TASK_ROUTER_VERSION = 'v1'
      TASK_ROUTER_WEBSOCKET_BASE_URL = 'https://event-bridge.twilio.com/v1/wschannels'

      REQUIRED = {required: true}
      OPTIONAL = {required: false}

      def initialize(account_sid, auth_token, workspace_sid, channel_id)
        super(account_sid, auth_token, TASK_ROUTER_VERSION, channel_id)
        @workspace_sid = workspace_sid
        @channel_id = channel_id

        @baseUrl = "#{TASK_ROUTER_BASE_URL}/#{TASK_ROUTER_VERSION}/Workspaces/#{workspace_sid}"

        validate_jwt

        if(@channel_id[0..1] == 'WS')
          @resourceUrl = @baseUrl
        elsif(@channel_id[0..1] == 'WK')
          @resourceUrl = @baseUrl + "/Workers/" + @channel_id
        elsif(@channel_id[0..1] == 'WQ')
          @resourceUrl = @baseUrl + "/TaskQueues/" + @channel_id
        end

        allow_websocket_requests(@channel_id)
        allow(@resourceUrl, "GET")
      end

      def allow_fetch_subresources
        allow(@resourceUrl + "/**", "GET")
      end

      def allow_updates
        allow(@resourceUrl, "POST")
      end

      def allow_updates_subresources
        allow(@resourceUrl + "/**", "POST")
      end

      def allow_delete
        allow(@resourceUrl, "DELETE")
      end

      def allow_delete_subresources
        allow(@resourceUrl + "/**", "DELETE")
      end

      def generate_token(ttl = 3600, extraAttributes = nil)
        taskRouterAttributes = {
            account_sid: @account_sid,
            workspace_sid: @workspace_sid,
            channel: @channel_id
        }
        
        if(@channel_id[0..1] == 'WK')
          taskRouterAttributes['worker_sid'] = @channel_id
        elsif(@channel_id[0..1] == 'WQ')
          taskRouterAttributes['taskqueue_sid'] = @channel_id
        end

        CapabilityAPI.instance_method(:generate_token).bind(self).call(ttl, taskRouterAttributes)
      end

      protected

      def allow_websocket_requests(channel_id)
        worker_url = "#{TASK_ROUTER_WEBSOCKET_BASE_URL}/#{@account_sid}/#{channel_id}"
        ['GET', 'POST'].each do |meth|
          add_policy(worker_url, meth)
        end
      end

      def validate_jwt
        if(@account_sid.nil? or @account_sid[0..1] != 'AC')
          raise "Invalid AccountSid provided #{@account_sid}"
        end
        if(@workspace_sid.nil? or @workspace_sid[0..1] != 'WS')
          raise "Invalid WorkspaceSid provided #{@workspace_sid}"
        end
        if(@channel_id.nil?)
          raise "ChannelId not provided"
        end
        @prefix = @channel_id[0..1]
        if(@prefix != 'WS' and @prefix != 'WK' and @prefix != 'WQ')
          raise "Invalid ChannelId provided: #{@channel_id}"
        end
      end
    end
    class WorkerCapability < Capability

      def initialize(account_sid, auth_token, workspace_sid, worker_sid)
        super(account_sid, auth_token, workspace_sid, worker_sid)
        @reservationsUrl = @baseUrl + "/Tasks/**"
        @activityUrl = @baseUrl + "/Activities"

        allow(@activityUrl, "GET")
        allow(@reservationsUrl, "GET")
      end

      def allow_activity_updates
        allow(@resourceUrl, "POST", nil, {ActivitySid: REQUIRED})
      end

      def allow_reservation_updates
        allow(@reservationsUrl, "POST", nil, {ReservationStatus: REQUIRED})
      end

    end

    class WorkspaceCapability < Capability

      def initialize(account_sid, auth_token, workspace_sid)
        super(account_sid, auth_token, workspace_sid, workspace_sid)
      end

    end

    class TaskQueueCapability < Capability

      def initialize(account_sid, auth_token, workspace_sid, taskqueue_sid)
        super(account_sid, auth_token, workspace_sid, taskqueue_sid)
      end

    end
  end
end

require 'twilio-ruby/rest/base_client'
module Twilio
  module REST
    class TaskRouterClient < BaseClient
      API_VERSION = 'v1'

      DEFAULTS = {
          host: 'taskrouter.twilio.com',
          port: 443,
          use_ssl: true,
          ssl_verify_peer: true,
          ssl_ca_file: File.dirname(__FILE__) + '/../../../conf/cacert.pem',
          timeout: 30,
          proxy_addr: nil,
          proxy_port: nil,
          proxy_user: nil,
          proxy_pass: nil,
          retry_limit: 1
      }

      attr_reader :workspace, :workspace_sid, :workspaces

      ##
      # Instantiate a new HTTP TaskRouter client to talk to Twilio. The parameters
      # +account_sid+, +auth_token+ and +workspace_sid are required, unless you
      # have configured them already using the block configure syntax, and used
      # to generate the HTTP basic auth header in each request. The +options+
      # parameter is a hash of connection configuration options. the following
      # keys are supported:
      #
      # === <tt>host: 'taskrouter.twilio.com'</tt>
      #
      # The domain to which you'd like the client to make HTTP requests. Useful
      # for testing. Defaults to 'api.twilio.com'.
      #
      # === <tt>port: 443</tt>
      #
      # The port on which to connect to the above domain. Defaults to 443 and
      # should be left that way except in testing environments.
      #
      # === <tt>use_ssl: true</tt>
      #
      # Declare whether ssl should be used for connections to the above domain.
      # Defaults to true and should be left alone except when testing.
      #
      # === <tt>ssl_verify_peer: true</tt>
      #
      # Declare whether to verify the host's ssl cert when setting up the
      # connection to the above domain. Defaults to true, but can be turned off
      # to avoid ssl certificate verification failures in environments without
      # the necessary ca certificates.
      #
      # === <tt>ssl_ca_file: '/path/to/ca/file'</tt>
      #
      # Specify the path to the certificate authority bundle you'd like to use
      # to verify Twilio's SSL certificate on each request. If not specified, a
      # certificate bundle extraced from Firefox is packaged with the gem and
      # used by default.
      #
      # === <tt>timeout: 30</tt>
      #
      # Set the time in seconds to wait before timing out the HTTP request.
      # Defaults to 30 seconds. If you aren't fetching giant pages of call or
      # SMS logs you can safely decrease this to something like 3 seconds or
      # lower. In paricular if you are sending SMS you can set this to 1 second
      # or less and swallow the exception if you don't care about the response.
      #
      # === <tt>proxy_addr: 'proxy.host.domain'</tt>
      #
      # The domain of a proxy through which you'd like the client to make HTTP
      # requests. Defaults to nil.
      #
      # === <tt>proxy_port: 3128</tt>
      #
      # The port on which to connect to the above proxy. Defaults to nil.
      #
      # === <tt>proxy_user: 'username'</tt>
      #
      # The user name to use for authentication with the proxy. Defaults to nil.
      #
      # === <tt>proxy_pass: 'password'</tt>
      #
      # The password to use for authentication with the proxy. Defaults to nil.
      #
      # === <tt>retry_limit: 1</tt>
      #
      # The number of times to retry a request that has failed before throwing
      # an exception. Defaults to one.
      def initialize(*args)
        @workspace_sid = args[2]
        if @workspace_sid.nil?
          raise ArgumentError, 'Workspace SID is required'
        end
        super(*args)
      end

      def inspect # :nodoc:
        "<Twilio::REST::TaskRouterClient @account_sid=#{@account_sid}>"
      end

      ##
      # Delegate workspace methods from the client. This saves having to call
      # <tt>client.workspace</tt> every time for resources on the default
      # workspace.
      def method_missing(method_name, *args, &block)
        if workspace.respond_to?(method_name)
          workspace.send(method_name, *args, &block)
        else
          super
        end
      end

      def respond_to?(method_name, include_private=false)
        if workspace.respond_to?(method_name, include_private)
          true
        else
          super
        end
      end

      ##
      # Get statistics of a task queue.
      def task_queue_statistics(task_queue_sid, *args) # :doc:
        if task_queue_sid.nil?
          raise ArgumentError, 'Task queue SID is required'
        end
        path = "/#{API_VERSION}/Workspaces/#{@workspace_sid}/TaskQueues/#{task_queue_sid}/Statistics"
        response = get path, args, true
        Twilio::REST::TaskRouter::TaskQueueStatistics.new path, self, response
      end

      ##
      # Get statistics of task queues.
      def task_queues_statistics(*args) # :doc:
        path = "/#{API_VERSION}/Workspaces/#{@workspace_sid}/TaskQueues/Statistics"
        stats = Twilio::REST::TaskRouter::TaskQueuesStatistics.new path, self
        stats.list args, true
      end

      ##
      # Get statistics of a worker.
      def worker_statistics(worker_sid, *args) # :doc:
        if worker_sid.nil?
          raise ArgumentError, 'Worker SID is required'
        end
        path = "/#{API_VERSION}/Workspaces/#{@workspace_sid}/Workers/#{worker_sid}/Statistics"
        response = get path, args, true
        Twilio::REST::TaskRouter::WorkerStatistics.new path, self, response
      end

      ##
      # Get statistics of workers.
      def workers_statistics(*args) # :doc:
        path = "/#{API_VERSION}/Workspaces/#{@workspace_sid}/Workers/Statistics"
        response = get path, args, true
        Twilio::REST::TaskRouter::WorkersStatistics.new path, self, response
      end

      ##
      # Get statistics of a workflow.
      def workflow_statistics(workflow_sid, *args) # :doc:
        if workflow_sid.nil?
          raise ArgumentError, 'Workflow SID is required'
        end
        path = "/#{API_VERSION}/Workspaces/#{@workspace_sid}/Workflows/#{workflow_sid}/Statistics"
        response = get path, args, true
        Twilio::REST::TaskRouter::WorkflowStatistics.new path, self, response
      end

      ##
      # Get statistics of a workspace.
      def workspace_statistics(*args) # :doc:
        path = "/#{API_VERSION}/Workspaces/#{@workspace_sid}/Statistics"
        response = get path, args, true
        Twilio::REST::TaskRouter::WorkspaceStatistics.new path, self, response
      end

      protected

      ##
      # Get the default config values.
      def get_defaults
        DEFAULTS
      end

      ##
      # Set up +workspace+ and +workspaces+ attributes.
      def set_up_subresources # :doc:
        @workspaces = Twilio::REST::TaskRouter::Workspaces.new "/#{API_VERSION}/Workspaces", self
        @workspace = @workspaces.get @workspace_sid
      end

      ##
      # Builds up full request path
      def build_full_path(path, params, method)
        path = path.dup
        path << "?#{url_encode(params)}" if method == :get && !params.empty?
        path
      end

    end
  end
end

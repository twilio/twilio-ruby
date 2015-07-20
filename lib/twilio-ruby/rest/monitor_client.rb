require 'twilio-ruby/rest/base_client'
module Twilio
  module REST
    class MonitorClient < BaseClient
      API_VERSION = 'v1'

      attr_reader :events
      attr_reader :alerts

      host 'monitor.twilio.com'

      ##
      # Instantiate a new HTTP Monitor client to talk to Twilio. The parameters
      # +account_sid+, +auth_token+ are required, unless you have configured
      # them already using the block configure syntax, and used to generate the
      # HTTP basic auth header in each request. The +options+ parameter is a
      # hash of connection configuration options. the following keys are
      # supported:
      #
      # === <tt>host: 'monitor.twilio.com'</tt>
      #
      # The domain to which you'd like the client to make HTTP requests. Useful
      # for testing. Defaults to 'monitor.twilio.com'.
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
      def inspect # :nodoc:
        "<Twilio::REST::MonitorClient @account_sid=#{@account_sid}>"
      end

      protected

      ##
      # Set up +events+ attribute.
      def set_up_subresources # :doc:
        @events = Twilio::REST::Monitor::Events.new "/#{API_VERSION}/Events", self
        @alerts = Twilio::REST::Monitor::Alerts.new "/#{API_VERSION}/Alerts", self
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

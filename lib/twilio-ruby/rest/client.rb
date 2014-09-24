module Twilio
  module REST
    ##
    # The Twilio::REST::Client class caches authentication parameters and
    # exposes methods to make HTTP requests to Twilio's REST API. However, you
    # should never really need to call these methods yourself since you can
    # work with the more pleasant wrapper objects like Twilio::REST::Call.
    #
    # Instantiate a client like so:
    #
    #   @client = Twilio::REST::Client.new account_sid, auth_token
    #
    # There are a few options you can use to configure the way your client will
    # communicate with Twilio. See #new for a list and descriptions.
    #
    # Once you have a client object you can use it to do fun things. Every
    # client object exposes two wrapper objects which you can use as entry
    # points into Twilio: +account+ and +accounts+.
    #
    # ==== @client.account
    #
    # Most of the time you'll want to start with the +account+ attribute. This
    # object is an instance of Twilio::REST::Account that wraps the account
    # referenced by the +account_sid+ you used when instantiating the client.
    #
    # An instance of Twilio::REST::Account exposes objects wrapping all of the
    # account-level Twilio resources as properties. So
    #
    #   @client.account.calls
    #
    # For convenience, the resources of the default account are also available
    # on the client object. So the following call is equivalent to the example
    # above
    #
    #   @client.calls
    #
    # represents an account's call list.
    #
    # ==== @client.accounts
    #
    # If you are doing anything related to subaccounts you'll want to start
    # here. This object is an instance of Twilio::REST::Accounts that wraps
    # the list of accounts belonging to the master account referenced by
    # the +account_sid+ used to instantiate the client.
    #
    # This class inherits from Twilio::REST::ListResource, so you can use
    # methods like ListResource#list to return a (possibly filtered) list of
    # accounts and ListResource#create to create a new account. Use
    # ListResource#get to grab a particular account once you know its sid.
    class Client
      include Twilio::Util
      include Twilio::REST::Utils

      API_VERSION = '2010-04-01'

      HTTP_HEADERS = {
        'Accept' => 'application/json',
        'Accept-Charset' => 'utf-8',
        'User-Agent' => "twilio-ruby/#{Twilio::VERSION}" \
                        " (#{RUBY_ENGINE}/#{RUBY_PLATFORM}" \
                        " #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL})"
      }

      DEFAULTS = {
        host: 'api.twilio.com',
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

      attr_reader :account_sid, :account, :accounts, :last_request,
        :last_response

      ##
      # Instantiate a new HTTP client to talk to Twilio. The parameters
      # +account_sid+ and +auth_token+ are required, unless you have configured
      # them already using the block configure syntax, and used to generate the
      # HTTP basic auth header in each request. The +options+ parameter is a
      # hash of connection configuration options. the following keys are
      # supported:
      #
      # === <tt>host: 'api.twilio.com'</tt>
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
        options = args.last.is_a?(Hash) ? args.pop : {}
        @config = DEFAULTS.merge! options

        @account_sid = args[0] || Twilio.account_sid
        @auth_token = args[1] || Twilio.auth_token
        if @account_sid.nil? || @auth_token.nil?
          raise ArgumentError, 'Account SID and auth token are required'
        end

        set_up_connection
        set_up_subresources
      end

      def inspect # :nodoc:
        "<Twilio::REST::Client @account_sid=#{@account_sid}>"
      end

      ##
      # Define #get, #put, #post and #delete helper methods for sending HTTP
      # requests to Twilio. You shouldn't need to use these methods directly,
      # but they can be useful for debugging. Each method returns a hash
      # obtained from parsing the JSON object in the response body.
      [:get, :put, :post, :delete].each do |method|
        method_class = Net::HTTP.const_get method.to_s.capitalize
        define_method method do |path, *args|
          params = twilify args[0]; params = {} if params.empty?
          unless args[1] # build the full path unless already given
            path = "#{path}.json"
            path << "?#{url_encode(params)}" if method == :get && !params.empty?
          end
          request = method_class.new path, HTTP_HEADERS
          request.basic_auth @account_sid, @auth_token
          request.form_data = params if [:post, :put].include? method
          connect_and_send request
        end
      end

      ##
      # Delegate account methods from the client. This saves having to call
      # <tt>client.account</tt> every time for resources on the default
      # account.
      def method_missing(method_name, *args, &block)
        if account.respond_to?(method_name)
          account.send(method_name, *args, &block)
        else
          super
        end
      end

      def respond_to?(method_name, include_private=false)
        if account.respond_to?(method_name, include_private)
          true
        else
          super
        end
      end

      private

      ##
      # Set up and cache a Net::HTTP object to use when making requests. This is
      # a private method documented for completeness.
      def set_up_connection # :doc:
        connection_class = Net::HTTP::Proxy @config[:proxy_addr],
          @config[:proxy_port], @config[:proxy_user], @config[:proxy_pass]
        @connection = connection_class.new @config[:host], @config[:port]
        set_up_ssl
        @connection.open_timeout = @config[:timeout]
        @connection.read_timeout = @config[:timeout]
      end

      ##
      # Set up the ssl properties of the <tt>@connection</tt> Net::HTTP object.
      # This is a private method documented for completeness.
      def set_up_ssl # :doc:
        @connection.use_ssl = @config[:use_ssl]
        if @config[:ssl_verify_peer]
          @connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
          @connection.ca_file = @config[:ssl_ca_file]
        else
          @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
      end

      ##
      # Set up +account+ and +accounts+ attributes.
      def set_up_subresources # :doc:
        @accounts = Twilio::REST::Accounts.new "/#{API_VERSION}/Accounts", self
        @account = @accounts.get @account_sid
      end

      ##
      # Send an HTTP request using the cached <tt>@connection</tt> object and
      # return the JSON response body parsed into a hash. Also save the raw
      # Net::HTTP::Request and Net::HTTP::Response objects as
      # <tt>@last_request</tt> and <tt>@last_response</tt> to allow for
      # inspection later.
      def connect_and_send(request) # :doc:
        @last_request = request
        retries_left = @config[:retry_limit]
        begin
          response = @connection.request request
          @last_response = response
          if response.kind_of? Net::HTTPServerError
            raise Twilio::REST::ServerError
          end
        rescue Exception
          raise if request.class == Net::HTTP::Post
          if retries_left > 0 then retries_left -= 1; retry else raise end
        end
        if response.body and !response.body.empty?
          object = MultiJson.load response.body
        end
        if response.kind_of? Net::HTTPClientError
          raise Twilio::REST::RequestError.new object['message'], object['code']
        end
        object
      end
    end
  end
end

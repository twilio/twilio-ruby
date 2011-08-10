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

      HTTP_HEADERS = {
        'Accept' => 'application/json',
        'User-Agent' => "twilio-ruby/#{Twilio::VERSION}",
      }

      attr_reader :account_sid, :account, :accounts, :last_request,
        :last_response

      ##
      # Instantiate a new HTTP client to talk to Twilio. The parameters
      # +account_sid+ and +auth_token+ are required and used to generate the
      # HTTP basic auth header in each request. The +options+ parameter is a
      # hash of connection configuration options. the following keys are
      # supported:
      #
      # === <tt>:host => 'api.twilio.com'</tt>
      #
      # The domain to which you'd like the client to make HTTP requests. Useful
      # for testing. Defaults to 'api.twilio.com'.
      #
      # === <tt>:port => 443</tt>
      #
      # The port on which to connect to the above domain. Defaults to 443 and
      # should be left that way except in testing environments.
      #
      # === <tt>:use_ssl => true</tt>
      #
      # Declare whether ssl should be used for connections to the above domain.
      # Defaults to true and should be left alone except when testing.
      #
      # === <tt>:ssl_verify_peer => true</tt>
      #
      # Declare whether to verify the host's ssl cert when setting up the
      # connection to the above domain. Defaults to true, but can be turned off
      # to avoid insecure connection warnings in environments without the proper
      # cert validation chain.
      #
      # === <tt>:proxy_addr => 'proxy.host.domain'</tt>
      #
      # The domain of a proxy through which you'd like the client to make HTTP
      # requests. Defaults to nil.
      #
      # === <tt>:proxy_port => 3128</tt>
      #
      # The port on which to connect to the above proxy. Defaults to nil.
      #
      # === <tt>:proxy_user => 'username'</tt>
      #
      # The user name to use for authentication with the proxy. Defaults to nil.
      #
      # === <tt>:proxy_pass => 'password'</tt>
      #
      # The password to use for authentication with the proxy. Defaults to nil.
      def initialize(account_sid, auth_token, options = {})
        @account_sid, @auth_token = account_sid.strip, auth_token.strip
        set_up_connection_from options
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
        define_method method do |uri, *args|
          params = twilify args[0]; params = {} if params.empty?
          uri += '.json' # create a local copy of the uri to manipulate
          uri << "?#{url_encode(params)}" if method == :get && !params.empty?
          request = method_class.new uri, HTTP_HEADERS
          request.basic_auth @account_sid, @auth_token
          request.form_data = params if [:post, :put].include? method
          connect_and_send request
        end
      end

      ##
      # Mimic the old (deprecated) interface. Make an HTTP request to Twilio
      # using the given +method+ and +uri+. If the +method+ is <tt>'GET'</tt>
      # then +params+ are appended to the +uri+ as urlencoded query parameters.
      # If the +method+ is <tt>'POST'</tt> or <tt>'PUT'</tt> then +params+ are
      # passed as an application/x-www-form-urlencoded string in the request
      # body.
      #
      # Returns the raw Net::HTTP::Response object.
      def request(uri, method = 'POST', params = {}) # :nodoc:
        raise ArgumentError, 'Invalid path parameter' if uri.empty?

        uri = "/#{uri}" unless uri.start_with? '/'

        case method.upcase
        when 'GET'
          uri << "?#{url_encode(params)}" if params
          req = Net::HTTP::Get.new uri
        when 'DELETE'
          req = Net::HTTP::Delete.new uri
        when 'PUT'
          req = Net::HTTP::Put.new uri
          req.form_data = params
        when 'POST'
          req = Net::HTTP::Post.new uri
          req.form_data = params
        else
          raise NotImplementedError, "HTTP #{method} not implemented"
        end

        req.basic_auth @account_sid, @auth_token
        @last_request = req
        @last_response = @connection.request req
      end

      private

      ##
      # Set up and cache a Net::HTTP object to use when making requests. This is
      # a private method documented for completeness.
      def set_up_connection_from(options = {}) # :doc:
        config = {:host => 'api.twilio.com', :port => 443, :use_ssl => true,
          :ssl_verify_peer => true}.merge! options
        connection_class = Net::HTTP::Proxy config[:proxy_addr],
          config[:proxy_port], config[:proxy_user], config[:proxy_pass]
        @connection = connection_class.new config[:host], config[:port]
        @connection.use_ssl = config[:use_ssl]
        unless config[:ssl_verify_peer]
          @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
      end

      ##
      # Set up +account+ and +accounts+ attributes.
      def set_up_subresources # :doc:
        accounts_uri = '/2010-04-01/Accounts'
        account_uri = "#{accounts_uri}/#{@account_sid}"
        @account = Twilio::REST::Account.new account_uri, self
        @accounts = Twilio::REST::Accounts.new accounts_uri, self
      end

      ##
      # Send an HTTP request using the cached <tt>@connection</tt> object and
      # return the JSON response body parsed into a hash. Also save the raw
      # Net::HTTP::Request and Net::HTTP::Response objects as
      # <tt>@last_request</tt> and <tt>@last_response</tt> to allow for
      # inspection later.
      def connect_and_send(request) # :doc:
        @last_request = request
        response = @connection.request request
        @last_response = response
        object = MultiJson.decode response.body if response.body
        if response.kind_of? Net::HTTPClientError
          raise Twilio::REST::RequestError, object['message']
        elsif response.kind_of? Net::HTTPServerError
          raise Twilio::REST::ServerError, object['message']
        end
        object
      end
    end
  end
end

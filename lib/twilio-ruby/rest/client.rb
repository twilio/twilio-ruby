module Twilio
  module REST
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
    # === @client.account
    #
    # Most of the time you'll want to start with the +account+ property. This
    # object is an instance of Twilio::REST::Account that wraps the account
    # referenced by the +account_sid+ you used when instantiating the client.
    #
    # The +@client.account+ object itself exposes objects wrapping all of the
    # account-level Twilio resources as properties. So +@client.account.calls+
    # represents an account's call list.
    #
    # === @client.accounts
    #
    # If you are doing anything related to subaccounts you'll want to start
    # here. This object is an instance of Twilio::REST::Accounts that wraps
    # the list of accounts belonging to the master account referenced by
    # the +account_sid+ used to instantiate the client.
    #
    # This class inherits
    # from Twilio::REST::ListResource, so you can use methods like #list to
    # return a (possibly filtered) list of accounts and #create to create a new
    # account. Use #get to grab a particular account once you know its sid.
    class Client

      include Twilio::Util
      include Twilio::REST::Utils

      HTTP_HEADERS = {
        'Accept' => 'application/json',
        'User-Agent' => 'twilio-ruby/3.2.1',
      }

      attr_reader :account_sid, :account, :accounts, :last_request,
        :last_response

      # Instantiate a new HTTP client to talk to Twilio. The parameters
      # +account_sid+ and +auth_token+ are required and used to generate the
      # HTTP basic auth header in each request.
      def initialize(account_sid, auth_token, domain = 'api.twilio.com',
                     proxy_host = nil, proxy_port = nil)
        @account_sid, @auth_token = account_sid, auth_token
        set_up_connection_to domain, proxy_host, proxy_port
        set_up_subresources
      end

      def inspect #:nodoc:
        "<Twilio::REST::Client @account_sid=#{@account_sid}>"
      end

      # Define #get, #put, #post and #delete helper methods for sending HTTP
      # requests to Twilio.
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

      # Mimic the old (deprecated) interface. Make an HTTP request to Twilio
      # using the given +method+ and +uri+. If the +method+ is 'GET' then
      # +params+ are appended to the +uri+ as urlencoded query parameters. If
      # the +method+ is 'POST' or 'PUT' then +params+ are passed as an
      # application/x-www-form-urlencoded string in the request body.
      #
      # Returns the raw Net::HTTP::Response object.
      def request(uri, method = 'POST', params = {})
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

      def set_up_connection_to(domain, proxy_host = nil, proxy_port = nil)
        connection_class = Net::HTTP::Proxy proxy_host, proxy_port
        @connection = connection_class.new domain, 443
        @connection.use_ssl = true
        # Don't check the server cert. Ideally this is configurable in case an
        # app wants to verify that it's actually talking to the real Twilio.
        # But cert validation is usually a nightmare, so we skip it for now.
        @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      def set_up_subresources
        accounts_uri = '/2010-04-01/Accounts'
        account_uri = "#{accounts_uri}/#{@account_sid}"
        # Set up a special handle to grab the account.
        @account = Twilio::REST::Account.new account_uri, self
        # Set up the accounts subresource.
        @accounts = Twilio::REST::Accounts.new accounts_uri, self
      end

      def connect_and_send(request)
        @last_request = request
        response = @connection.request request
        @last_response = response
        object = JSON.parse response.body if response.body
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

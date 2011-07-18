module Twilio
  module REST
    class Client

      include Twilio::Util
      include Twilio::REST::Utils

      attr_reader :account_sid, :account, :accounts

      def initialize(account_sid, auth_token, domain = 'api.twilio.com',
                     proxy_host = nil, proxy_port = nil)
        @account_sid, @auth_token = account_sid, auth_token
        set_up_connection_to domain, proxy_host, proxy_port
        set_up_subresources
      end

      # Define some helper methods for sending HTTP requests
      [:get, :put, :post, :delete].each do |method|
        method_class = Net::HTTP.const_get method.to_s.capitalize
        define_method method do |uri, *args|
          uri << '.json'
          params = twilify(args[0]); params = {} if params.empty?
          uri << "?#{url_encode(params)}" if !params.empty? && method == :get
          headers = {
            'Accept' => 'application/json',
            'User-Agent' => 'twilio-ruby/3.1.0'
          }
          request = method_class.new uri, headers
          request.basic_auth @account_sid, @auth_token
          request.form_data = params if [:post, :put].include? method
          http_response = @connection.request request
          object = JSON.parse http_response.body if http_response.body
          if http_response.kind_of? Net::HTTPClientError
            raise Twilio::REST::RequestError, object['message']
          elsif http_response.kind_of? Net::HTTPServerError
            raise Twilio::REST::ServerError, object['message']
          end
          object
        end
      end

      # Mimic the old (deprecated) interface
      def request(uri, method = 'POST', params = {})
        raise ArgumentError, 'Invalid path parameter' if uri.empty?

        uri = "/#{uri}" unless uri.start_with? '/'

        case method
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
        @connection.request req
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

    end
  end
end

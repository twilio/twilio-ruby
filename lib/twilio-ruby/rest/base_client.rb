module Twilio
  module REST
    class BaseClient
      include Twilio::Util
      include Twilio::REST::Utils

      HTTP_HEADERS = {
          'Accept' => 'application/json',
          'Accept-Charset' => 'utf-8',
          'User-Agent' => "twilio-ruby/#{Twilio::VERSION}" \
                        " (#{RUBY_ENGINE}/#{RUBY_PLATFORM}" \
                        " #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL})"
      }

      ##
      # Override the default host for a REST Client (api.twilio.com)
      def self.host(host=nil)
        return @host unless host
        @host = host
      end

      attr_reader :account_sid, :last_request, :last_response

      def initialize(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        options[:host] ||= self.class.host
        @config = Twilio::Util::ClientConfig.new options

        @account_sid = args[0] || Twilio.account_sid
        @auth_token = args[1] || Twilio.auth_token
        if @account_sid.nil? || @auth_token.nil?
          raise ArgumentError, 'Account SID and auth token are required'
        end

        set_up_connection
        set_up_subresources
      end

      ##
      # Define #get, #put, #post and #delete helper methods for sending HTTP
      # requests to Twilio. You shouldn't need to use these methods directly,
      # but they can be useful for debugging. Each method returns a hash
      # obtained from parsing the JSON object in the response body.
      [:get, :put, :post, :delete].each do |method|
        method_class = Net::HTTP.const_get method.to_s.capitalize
        define_method method do |path, *args|
          params = twilify(args[0])
          params = {} if params.empty?
          # build the full path unless already given
          path = build_full_path(path, params, method) unless args[1]
          request = method_class.new(path, HTTP_HEADERS)
          request.basic_auth(@account_sid, @auth_token)
          request.form_data = params if [:post, :put].include?(method)
          connect_and_send(request)
        end
      end

      protected

      ##
      # Builds up full request path
      # Needs implementation in child classes
      def build_full_path(path, params, method)
        raise NotImplementedError
      end

      ##
      # Set up and cache a Net::HTTP object to use when making requests. This is
      # a private method documented for completeness.
      def set_up_connection # :doc:
        connection_class = Net::HTTP::Proxy @config.proxy_addr,
                                            @config.proxy_port, @config.proxy_user, @config.proxy_pass
        @connection = connection_class.new @config.host, @config.port
        set_up_ssl
        @connection.open_timeout = @config.timeout
        @connection.read_timeout = @config.timeout
      end

      ##
      # Set up the ssl properties of the <tt>@connection</tt> Net::HTTP object.
      # This is a private method documented for completeness.
      def set_up_ssl # :doc:
        @connection.use_ssl = @config.use_ssl
        if @config.ssl_verify_peer
          @connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
          @connection.ca_file = @config.ssl_ca_file
        else
          @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
      end

      ##
      # Set up sub resources attributes.
      def set_up_subresources # :doc:
        # To be overridden
      end

      ##
      # Send an HTTP request using the cached <tt>@connection</tt> object and
      # return the JSON response body parsed into a hash. Also save the raw
      # Net::HTTP::Request and Net::HTTP::Response objects as
      # <tt>@last_request</tt> and <tt>@last_response</tt> to allow for
      # inspection later.
      def connect_and_send(request) # :doc:
        @last_request = request
        retries_left = @config.retry_limit
        begin
          response = @connection.request request
          @last_response = response
          if response.kind_of? Net::HTTPServerError
            raise Twilio::REST::ServerError
          end
        rescue
          raise if request.class == Net::HTTP::Post
          if retries_left > 0 then retries_left -= 1; retry else raise end
        end
        if response.body and !response.body.empty?
          object = MultiJson.load response.body
        elsif response.kind_of? Net::HTTPBadRequest
          object = { message: 'Bad request', code: 400 }
        end

        if response.kind_of? Net::HTTPClientError
          raise Twilio::REST::RequestError.new object['message'], object['code']
        end
        object
      end
    end
  end
end

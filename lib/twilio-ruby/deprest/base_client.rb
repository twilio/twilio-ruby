require 'json'
require_relative 'http_client.rb'

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

        @http_client = HTTPClient.new(@config)

        set_up_subresources
      end

      def http_client_class=(new_client)
        @http_client = new_client.new(@config)
      end

      def http_client
        @http_client
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
          path = "/#{@API_VERSION}" + path
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
        response = @http_client.request(request)
        case response.status_code
        when 500
          raise Twilio::REST::ServerError
        when 300..499
          raise Twilio::REST::RequestError.new response.body['message'], response.body['code']
        end

        response.body
      end
    end
  end
end

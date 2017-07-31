module Twilio
  module REST
    # Representation of a Twilio subdomain
    class Domain
      attr_reader :client

      # @param [Client] client An instantiated Twilio Http Client
      def initialize(client)
        @client = client
        @host = nil
        @base_url = nil
        @port = nil
      end

      # Converts a relative url to an absolute url
      # @param [String] uri the Http uri to convert
      def absolute_url(uri)
        "#{@base_url.chomp('/')}/#{uri.chomp('/').gsub(/^\//, '')}"
      end

      # Makes an HTTP request to this domain
      # @param [String] method The HTTP method
      # @param [String] uri The HTTP uri to request
      # @param [Hash] params Query parameters appended to the request
      # @param [Hash] data Body parameters in the request
      # @param [Hash] headers HTTP headers to send with the request
      # @param [Array] auth Basic auth arguments
      # @param [Integer] timeout Socket read timeout for the request
      def request(method, uri, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        url = uri.match(/^http/) ? uri : absolute_url(uri)

        @client.request(
          @host,
          @port,
          method,
          url,
          params,
          data,
          headers,
          auth,
          timeout
        )
      end
    end
  end
end

module Twilio
  module REST
    class Domain
      attr_reader :client

      def initialize(client)
        @client = client
        @host = nil
        @base_url = nil
        @port = nil
      end

      def absolute_url(uri)
        "#{@base_url.chomp('/')}/#{uri.chomp('/')}"
      end

      def request(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        url = url_join(@base_url, uri)

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

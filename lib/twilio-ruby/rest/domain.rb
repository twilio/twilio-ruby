module Twilio
  module REST
    class Domain
      attr_reader :client

      def initialize(client)
        @client = client
        @host = nil
        @port = nil
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

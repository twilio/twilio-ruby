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
        "#{@base_url.chomp('/')}/#{uri.chomp('/').gsub(/^\//, '')}"
      end

      def request(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        if uri.match(/^http/)
          url = uri
        else
          url = self.absolute_url(uri)
        end

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

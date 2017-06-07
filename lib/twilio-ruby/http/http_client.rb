require 'faraday'

module Twilio
  module HTTP
    class Client
      attr_accessor :adapter

      def initialize(proxy_addr=nil, proxy_port=nil, proxy_user=nil, proxy_pass=nil, ssl_ca_file=nil)
        @proxy_addr = proxy_addr
        @proxy_port = proxy_port
        @proxy_user = proxy_user
        @proxy_pass = proxy_pass
        @ssl_ca_file = ssl_ca_file
        @adapter = Faraday.default_adapter

        # Set default params encoder
        Faraday::Utils.default_params_encoder = Faraday::FlatParamsEncoder
      end

      def request(host, port, method, url, params={}, data={}, headers={}, auth=nil, timeout=nil)
        @connection = Faraday.new(url: host + ":" + port.to_s, ssl: {verify: true}) do |f|
          f.request :url_encoded
          f.adapter @adapter
          f.headers = headers
          f.basic_auth(auth[0], auth[1])
          if @proxy_addr
            f.proxy "#{@proxy_user}:#{@proxy_pass}@#{@proxy_addr}:#{@proxy_port}"
          end
          f.options.open_timeout = timeout
          f.options.timeout = timeout
        end

        response = @connection.send(method.downcase.to_sym, url, method == 'GET' ? params : data)

        @last_response = response
        if response.body and !response.body.empty?
          object = response.body
        elsif response.status == 400
          object = { message: 'Bad request', code: 400 }.to_json
        end

        TwilioResponse.new(response.status, object)
      end
    end

  end
end

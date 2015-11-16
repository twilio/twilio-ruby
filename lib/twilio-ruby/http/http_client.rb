module Twilio
  module HTTP
    class Client
      def initialize(proxy_addr=nil, proxy_port=nil, proxy_user=nil, proxy_pass=nil, ssl_ca_file=nil)
        @proxy_addr = proxy_addr
        @proxy_port = proxy_port
        @proxy_user = proxy_user
        @proxy_pass = proxy_pass
        @ssl_ca_file = ssl_ca_file
      end

      def request(host, port, method, url, params={}, data={}, headers={}, auth=nil, timeout=nil)
        connection_class = Net::HTTP::Proxy @proxy_addr,
                                            @proxy_port,
                                            @proxy_user,
                                            @proxy_pass

        @connection = connection_class.new host, port
        @connection.use_ssl = true
        @connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
        @connection.ca_file = @ssl_ca_file
        @connection.open_timeout = timeout
        @connection.read_timeout = timeout

        method_class = Net::HTTP.const_get method.to_s.capitalize
        url = "#{url}?#{url_encode(params)}" if method == :get && !params.empty?
        request = method_class.new(url, headers)
        request.basic_auth(auth[0], auth[1])
        request.form_data = data if [:post, :put].include?(method)

        @last_request = request
        response = @connection.request request
        @last_response = response
        if response.body and !response.body.empty?
          object = response.body
        elsif response.kind_of? Net::HTTPBadRequest
          object = { message: 'Bad request', code: 400 }.to_json
        end

        TwilioResponse.new(response.code.to_i, object)
      end
    end

  end
end

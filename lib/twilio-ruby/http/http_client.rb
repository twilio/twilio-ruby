# frozen_string_literal: true

require 'faraday'

module Twilio
  module HTTP
    class Client
      attr_accessor :adapter
      attr_reader :timeout, :last_response, :last_request

      def initialize(proxy_addr = nil, proxy_port = nil, proxy_user = nil, proxy_pass = nil, ssl_ca_file = nil,
                     timeout: nil)
        @proxy_addr = proxy_addr
        @proxy_port = proxy_port
        @proxy_user = proxy_user
        @proxy_pass = proxy_pass
        @ssl_ca_file = ssl_ca_file
        @timeout = timeout
        @adapter = Faraday.default_adapter
      end

      def _request(request)
        @connection = Faraday.new(url: request.host + ':' + request.port.to_s, ssl: { verify: true }) do |f|
          f.options.params_encoder = Faraday::FlatParamsEncoder
          f.request :url_encoded
          f.adapter @adapter
          f.headers = request.headers
          f.basic_auth(request.auth[0], request.auth[1])
          if @proxy_addr
            f.proxy "#{@proxy_user}:#{@proxy_pass}@#{@proxy_addr}:#{@proxy_port}"
          end
          f.options.open_timeout = request.timeout || @timeout
          f.options.timeout = request.timeout || @timeout
        end

        @last_request = request
        @last_response = nil
        response = @connection.send(request.method.downcase.to_sym,
                                    request.url,
                                    request.method == 'GET' ? request.params : request.data)

        if response.body && !response.body.empty?
          object = response.body
        elsif response.status == 400
          object = { message: 'Bad request', code: 400 }.to_json
        end

        twilio_response = Twilio::Response.new(response.status, object, headers: response.headers)
        @last_response = twilio_response

        twilio_response
      end

      def request(host, port, method, url, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        request = Twilio::Request.new(host, port, method, url, params, data, headers, auth, timeout)
        _request(request)
      end
    end
  end
end

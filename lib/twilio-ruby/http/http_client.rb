# frozen_string_literal: true

require 'faraday'

module Twilio
  module HTTP
    class Client
      attr_accessor :adapter
      attr_reader :timeout, :last_response, :last_request

      def initialize(proxy_prot = nil, proxy_addr = nil, proxy_port = nil, proxy_user = nil, proxy_pass = nil,
                     ssl_ca_file = nil, timeout: nil)
        @proxy_prot = proxy_prot
        @proxy_path = "#{proxy_addr}:#{proxy_port}" if proxy_addr && proxy_port
        @proxy_auth = "#{proxy_user}:#{proxy_pass}@" if proxy_pass && proxy_user
        @ssl_ca_file = ssl_ca_file
        @timeout = timeout
        @adapter = Faraday.default_adapter
        @configure_connection_blocks = []
      end

      def configure_connection(&block)
        raise ArgumentError, "#{__method__} must be given a block!" unless block_given?

        @configure_connection_blocks << block
        nil
      end

      def _request(request)
        @connection = Faraday.new(url: request.host + ':' + request.port.to_s, ssl: { verify: true }) do |f|
          f.options.params_encoder = Faraday::FlatParamsEncoder
          f.request :url_encoded
          f.headers = request.headers
          f.request(:basic_auth, request.auth[0], request.auth[1])
          f.proxy = "#{@proxy_prot}://#{@proxy_auth}#{@proxy_path}" if @proxy_prot && @proxy_path
          f.options.open_timeout = request.timeout || @timeout
          f.options.timeout = request.timeout || @timeout

          @configure_connection_blocks.each { |block| block.call(f) }
          f.adapter @adapter
        end

        @last_request = request
        @last_response = nil

        response = send(request)
        if response.status == 504
          object = { message: 'Request timeout', code: 504 }.to_json
        elsif response.body && !response.body.empty?
          object = response.body
        elsif response.status == 400
          object = { message: 'Bad request', code: 400 }.to_json
        end

        twilio_response = Twilio::Response.new(response.status, object, headers: response.headers)
        @last_response = twilio_response

        twilio_response
      end

      def send(request)
        @connection.send(request.method.downcase.to_sym,
                         request.url,
                         request.method == 'GET' ? request.params : request.data)
      rescue Faraday::Error => e
        raise Twilio::REST::TwilioError, e
      end

      def request(host, port, method, url, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        request = Twilio::Request.new(host, port, method, url, params, data, headers, auth, timeout)
        _request(request)
      end
    end
  end
end

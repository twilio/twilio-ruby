# frozen_string_literal: true

require 'faraday'

module Twilio
  module HTTP
    class Client
      attr_accessor :adapter
      attr_reader :timeout, :last_response, :last_request, :connection

      def initialize(proxy_prot = nil, proxy_addr = nil, proxy_port = nil, proxy_user = nil, proxy_pass = nil,
                     timeout: nil)
        @proxy_prot = proxy_prot
        @proxy_path = "#{proxy_addr}:#{proxy_port}" if proxy_addr && proxy_port
        @proxy_auth = "#{proxy_user}:#{proxy_pass}@" if proxy_pass && proxy_user
        @timeout = timeout
        @adapter = Faraday.default_adapter
        @configure_connection_blocks = []
      end

      def configure_connection(&block)
        raise ArgumentError, "#{__method__} must be given a block!" unless block_given?

        @configure_connection_blocks << block
        nil
      end

      def _request(request) # rubocop:disable Metrics/MethodLength
        middle_ware = case request.headers['Content-Type']
                      when 'application/json'
                        :json
                      when 'application/x-www-form-urlencoded'
                        :url_encoded
                      else
                        :url_encoded
                      end
        @connection = Faraday.new(url: request.host + ':' + request.port.to_s, ssl: { verify: true }) do |f|
          f.options.params_encoder = Faraday::FlatParamsEncoder
          f.request(middle_ware)
          f.headers = request.headers
          f.headers['Authorization'] = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IkFjTlFMbXpUWThMVGM1UTdxX3dzciJ9.eyJodHRwOi8vdHdpbGlvL3ZhbGlkcmVnaW9ucyI6InVzMSIsImh0dHA6Ly90d2lsaW8vYWN0Ijp7InN1YiI6Ik9SNjU3ZGRkZjM4NWMwNGI2MWYxOTJiMWQ3YTM3MDNjNTkifSwiaHR0cDovL3R3aWxpby9zdWIiOiJPUTM0ZGEwNWUxNTE2MTJkYzVkZjI0NTgzY2QyMjFkZmU0IiwiaHR0cDovL3R3aWxpby90eXAiOiJ2bmQudHdpbGlvLm9hdXRoLmF0K2p3dDsiLCJpc3MiOiJodHRwczovL2FwaS50d2lsaW8uYXV0aDBhcHAuY29tLyIsInN1YiI6IkVpMEZUTkptTEFMZnp5NkQ4OUtobVlzaWpHRkswRElEQGNsaWVudHMiLCJhdWQiOiJodHRwczovL2FwaS50d2lsaW8uY29tL3YyL29yZ2FuaXphdGlvbnMiLCJpYXQiOjE3MzAzNzY5NDIsImV4cCI6MTczMDQ2MzM0MiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiYXpwIjoiRWkwRlROSm1MQUxmenk2RDg5S2htWXNpakdGSzBESUQifQ.a5XfABzmxlL7EHorXSOL-uFSnOwBCgC40kR3PycjhXMi8X1jlz3CLHm5O3NzZ7dRRg9p8sL3s7mTDCDbaW9BfokHVEnXFSvVa61tl9WIHZpfpXcaKFNeT5ryMcTJE-_jivB0EyJfX1xnTiceGsDy6KcKXN0R5zVy-d707yoEvOgy1Gw8J9JaWNPirVf3Te8qs0sV0oW6fbbX_ZHTWzfjU1msY3CSowqQXEQXGfGhWxUyt9MzprY4smE_QCak0_OMxCzx2U5D9dJ7bvZSgM9iCbsd7MF0PuPg5EUeL-meG-k0HwLHxC9S7iQqXM1MjyB-qAqpKdmnvDIaE8DDJ5tiTA'
          # if Faraday::VERSION.start_with?('2.')
          # f.request(:authorization, :basic, "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IkFjTlFMbXpUWThMVGM1UTdxX3dzciJ9.eyJodHRwOi8vdHdpbGlvL3ZhbGlkcmVnaW9ucyI6InVzMSIsImh0dHA6Ly90d2lsaW8vYWN0Ijp7InN1YiI6Ik9SNjU3ZGRkZjM4NWMwNGI2MWYxOTJiMWQ3YTM3MDNjNTkifSwiaHR0cDovL3R3aWxpby9zdWIiOiJPUTM0ZGEwNWUxNTE2MTJkYzVkZjI0NTgzY2QyMjFkZmU0IiwiaHR0cDovL3R3aWxpby90eXAiOiJ2bmQudHdpbGlvLm9hdXRoLmF0K2p3dDsiLCJpc3MiOiJodHRwczovL2FwaS50d2lsaW8uYXV0aDBhcHAuY29tLyIsInN1YiI6IkVpMEZUTkptTEFMZnp5NkQ4OUtobVlzaWpHRkswRElEQGNsaWVudHMiLCJhdWQiOiJodHRwczovL2FwaS50d2lsaW8uY29tL3YyL29yZ2FuaXphdGlvbnMiLCJpYXQiOjE3MzAyNzQ3NDIsImV4cCI6MTczMDM2MTE0MiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiYXpwIjoiRWkwRlROSm1MQUxmenk2RDg5S2htWXNpakdGSzBESUQifQ.GZBPTTWgvJExD949qOvQzQZxQRoqzcbyiL-2u9yc4QBo9UjU12hNoqWdqqCTYUwrffvEIkEdsqaZP87iYM95K0ayoW3MsdVO_MzLxSy-5_IaI3efdDEBO3fBb5dQhbflxnR5e2npSdSD3mkGUYVOdxKZKkQ4Waw1sLlBEfFGysZgh1_JJk_nFS8DVIaYF-pVtWLCyjstTO8EwyUdt1eNvU-119lWhIk8qiEDSzCM2AHbVot_7njTIHpByd8i_PeLjkhUSdEnX2IPkUbY6LzQHDD1fUm9hGWnWyjaaLLcEKYFkfeb-fHskQLoWO0Hyc4GbnwXpXokzL37HncEb2G3tw")
          # else
          #   f.request(:basic_auth, request.auth[0], request.auth[1])
          # end
          f.proxy = "#{@proxy_prot}://#{@proxy_auth}#{@proxy_path}" if @proxy_prot && @proxy_path
          f.options.open_timeout = request.timeout || @timeout
          f.options.timeout = request.timeout || @timeout
          f.params = request.params.nil? ? {} : request.params

          @configure_connection_blocks.each { |block| block.call(f) }
          f.adapter @adapter
        end

        @last_request = request
        @last_response = nil

        response = send(request)
        if (500..599).include?(response.status)
          object = { message: "Server error (#{response.status})", code: response.status }.to_json
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
                         request.data)
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

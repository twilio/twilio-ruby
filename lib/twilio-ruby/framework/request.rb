# frozen_string_literal: true

module Twilio
  class Request
    attr_reader :host, :port, :method, :url, :params, :data, :headers, :auth, :timeout

    def initialize(host, port, method, url, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
      @host = host
      @port = port
      @url = url
      @method = method
      @params = params
      @data = data
      @headers = headers
      @auth = auth
      @timeout = timeout
    end

  end
end

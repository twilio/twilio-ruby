module Twilio
  class Response
    attr_accessor :status_code, :body

    def initialize(status_code, body)
      @status_code = status_code
      body = '{}' if !body || body.empty?
      @body = JSON.parse(body)
    end

    def to_s
      "[#{status_code}] #{body}"
    end
  end
end

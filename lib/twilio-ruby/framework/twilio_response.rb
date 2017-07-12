module Twilio
  class TwilioResponse
    attr_accessor :status_code, :body

    def initialize(status_code, body)
      @status_code = status_code
      json_body = body
      json_body = '{}' if !body || body.empty?
      @body = JSON.parse(json_body)
    rescue JSON::ParserError
      @body = body
    end

    def to_s
      "[#{status_code}] #{body}"
    end
  end
end

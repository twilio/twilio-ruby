# frozen_string_literal: true

module Twilio
  class TwilioResponse
    attr_accessor :status_code, :body

    # @deprecated Use 'Twilio::Response' instead.
    def initialize(status_code, body)
      warn "'Twilio::TwilioResponse' has been deprecated. Use 'Twilio::Response' instead."
      response = Twilio::Response.new(status_code, body)
      @status_code = response.status_code
      @body = response.body
    end

    def to_s
      "[#{@status_code}] #{@body}"
    end
  end
end

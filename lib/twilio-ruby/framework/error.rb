module Twilio
  module REST
    # A generic error
    class TwilioError < StandardError
      attr_reader :message, :body

      def initialize(message, body = nil)
        @message = message
        @body = body
      end

      def to_s
        "#{@message}: #{@body || 'no body'}"
      end
    end

    # A generic 4XX or 5XX error from the Twilio API
    class RestError < TwilioError
      attr_reader :message, :code, :status_code

      # @param [String] message The human readable error message
      # @param [String] code The Twilio specific error code
      # @param [String] status_code The HTTP status that was returned
      def initialize(message, code, status_code)
        @message = message
        @code = code
        @status_code = status_code
      end

      def to_s
        "[HTTP #{status_code}] #{code} : #{message}"
      end
    end
  end
end

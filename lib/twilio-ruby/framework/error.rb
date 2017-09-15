module Twilio
  module REST
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

    class RestError < TwilioError
      attr_reader :message, :code, :status_code

      def initialize(message, code, status_code)
        @message = message
        @code = code
        @status_code = status_code
      end

      def to_s
        "[HTTP #{status_code}] #{code} : #{message}"
      end
    end

    class ObsoleteError < StandardError
    end
  end
end

module Twilio
  module REST
    class TwilioException < Exception
      def initialize(msg, body = nil)
        @msg = msg
        @body = body
      end

      def to_s
        "#{@msg}: #{@body || 'no body'}"
      end
    end

    class RestException < TwilioException
      attr_accessor :msg, :code, :status_code

      def initialize(msg, code, status_code)
        @msg = msg
        @code = code
        @status_code = status_code
      end

      def to_s
        "[HTTP #{status_code}] #{code} : #{msg}"
      end
    end
  end
end

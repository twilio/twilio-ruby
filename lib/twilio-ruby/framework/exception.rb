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
  end
end

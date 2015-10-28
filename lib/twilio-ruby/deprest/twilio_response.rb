module Twilio
  module REST
    class TwilioResponse
      attr_accessor :status_code, :body

      def initialize(status_code, body)
        @status_code = status_code
        @body = JSON.parse(body)
      end
    end
  end
end

module Twilio
  module REST
    class ServerError < StandardError; end

    class RequestError < StandardError
      attr_reader :code

      def initialize(message, code=nil);
        super message
        @code = code
      end

      def to_s
        "#{code} - #{message}"
      end
    end
  end
end

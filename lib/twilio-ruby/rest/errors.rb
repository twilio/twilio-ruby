module Twilio
  module REST
    class ServerError < StandardError
      attr_reader :code

      def initialize(message, code)
        super "#{code} - #{message}"
        @code = code
      end
    end

    class RequestError < StandardError
      attr_reader :code

      def initialize(message, code=nil);
        super message
        @code = code
      end
    end
  end
end

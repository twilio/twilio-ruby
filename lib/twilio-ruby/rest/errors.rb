module Twilio
  module REST
    class ServerError < StandardError; end

    class RequestError< StandardError
      attr_reader :code
      def initialize(msg, code=nil);
        super(msg);
        @code = code;
      end
    end
  end
end

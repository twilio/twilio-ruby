module Twilio
  module REST
    class ServerError < StandardError; end
    class RequestError < StandardError; end
    class InvalidNumber < RequestError; end
    class InternationalSmsUnavailable < RequestError; end
  end
end

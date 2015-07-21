module Twilio
  module REST
    class Sms < ListResource
      def initialize(path, client)
        @path, @client = path, client
        @submodule = :SMS
        resource :messages,
                 :short_codes
      end
    end
  end
end

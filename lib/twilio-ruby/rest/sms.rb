module Twilio
  module REST
    class Sms < ListResource
      def initialize(path, client)
        super
        @submodule = :SMS
        resource :messages,
                 :short_codes
      end
    end
  end
end

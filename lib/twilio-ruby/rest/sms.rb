module Twilio
  module REST
    class Sms < InstanceResource
      def initialize(path, client, params={})
        super
        resource :messages, :short_codes
      end
    end
  end
end

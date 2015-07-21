module Twilio
  module REST
    class DependentPhoneNumbers < ListResource
      def initialize(path, client)
        super
        @instance_class = Twilio::REST::IncomingPhoneNumber
      end
    end
  end
end

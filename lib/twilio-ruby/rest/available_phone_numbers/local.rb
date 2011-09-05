module Twilio
  module REST
    class Local < ListResource
      def initialize(uri, client)
        @resource_name = 'available_phone_numbers'
        @instance_class = Twilio::REST::AvailablePhoneNumber
        @uri, @client = uri, client
      end
    end
  end
end

module Twilio
  module REST
    class TollFree < ListResource
      def initialize(uri, client)
        @resource_name = 'available_phone_numbers'
        @instance_class = Twilio::REST.const_get 'AvailablePhoneNumber'
        @uri, @client = uri, client
      end
    end
  end
end

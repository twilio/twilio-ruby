module Twilio
  module REST
    class TollFree < ListResource
      def initialize(uri, client)
        @uri, @client = uri, client
        @instance_class = Twilio::REST::AvailablePhoneNumber
        @list_key, @instance_id_key = 'available_phone_numbers', 'sid'
      end
    end
  end
end

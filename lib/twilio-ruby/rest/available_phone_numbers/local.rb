module Twilio
  module REST
    class Local < ListResource
      def initialize(path, client)
        super
        @instance_class = Twilio::REST::AvailablePhoneNumber
        @list_key = 'available_phone_numbers'
        @instance_id_key = 'sid'
      end
    end
  end
end

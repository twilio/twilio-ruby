module Twilio
  module REST
    module NumberType
      class Mobile < ListResource
        def initialize(path, client)
          super
          @instance_class = Twilio::REST::IncomingPhoneNumber
          @list_key = 'incoming_phone_numbers'
          @instance_id_key = 'sid'
        end
      end
    end
  end
end

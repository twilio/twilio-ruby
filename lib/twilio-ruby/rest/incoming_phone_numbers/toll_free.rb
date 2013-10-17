module Twilio
  module REST
    module NumberType
      class TollFree < ListResource
        def initialize(path, client)
          @path, @client = path, client
          @instance_class = Twilio::REST::IncomingPhoneNumber
          @list_key, @instance_id_key = 'incoming_phone_numbers', 'sid'
        end
      end
    end
  end
end

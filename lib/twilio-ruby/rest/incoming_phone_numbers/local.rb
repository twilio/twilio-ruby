module Twilio
  module REST
    module NumberType
      class Local < ListResource
        def initialize(path, client)
          @path, @client = path, client
          @instance_class = Twilio::REST::IncomingPhoneNumber
          @list_key = 'incoming_phone_numbers'
          @instance_id_key = 'sid'
        end
      end
    end
  end
end

module Twilio
  module REST
    module IncomingPhoneNumbers
      class Mobile < ListResource
        def initialize(path, client)
          super
          list_key 'incoming_phone_numbers'
        end
      end
    end
  end
end

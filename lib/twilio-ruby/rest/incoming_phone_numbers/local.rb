module Twilio
  module REST
    module IncomingPhoneNumbers
      class Local < ListResource
        def initialize(path, client)
          super
          list_key 'incoming_phone_numbers'
        end
      end
    end
  end
end

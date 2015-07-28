module Twilio
  module REST
    class IncomingPhoneNumbers
      class Local < ListResource
        can :list
        def initialize(client)
          super
          list_key 'incoming_phone_numbers'
        end
      end
    end
  end
end

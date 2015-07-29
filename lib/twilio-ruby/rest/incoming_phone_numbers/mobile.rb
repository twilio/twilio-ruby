module Twilio
  module REST
    class IncomingPhoneNumbers
      class Mobile < ListResource
        can :list

        def initialize(client)
          super
          path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/Mobile.json"
          list_key 'incoming_phone_numbers'
        end
      end
    end
  end
end

module Twilio
  module REST
    class IncomingPhoneNumbers
      class Local < ListResource
        can :list
        
        def initialize(client)
          super
          path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/Local.json"
          list_key 'incoming_phone_numbers'
        end
      end
    end
  end
end

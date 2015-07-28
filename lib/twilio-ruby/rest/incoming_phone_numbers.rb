module Twilio
  module REST
    class IncomingPhoneNumbers < ListResource
      can :list, :get, :create

      def initialize(client)
        super
        path "/Accounts/#{@account_sid}/IncomingPhoneNumbers.json"
      end

      def buy(phone_number)
        create phone_number: phone_number
      end
    end

    class IncomingPhoneNumber < InstanceResource
      can :update, :delete
      
      def initialize(client, params={})
        super
        path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/#{@sid}"
      end
    end
  end
end

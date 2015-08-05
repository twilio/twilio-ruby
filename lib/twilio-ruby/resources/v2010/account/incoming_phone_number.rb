module Twilio
  module Resources
    module V2010
      class AccountInstance
        class IncomingPhoneNumberList < ListResource
          can :list, :get, :create
          command_alias :incoming_phone_numbers
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/IncomingPhoneNumbers.json"
            instance_id_key 'sid'
            instance_class IncomingPhoneNumberInstance
            components Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::IncomingPhoneNumberLocalList,
                       Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::IncomingPhoneNumberMobileList,
                       Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::IncomingPhoneNumberTollFreeList
          end
          
          def buy(phone_number)
            create phone_number: phone_number
          end
        end
      
        class IncomingPhoneNumberInstance < InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
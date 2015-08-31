module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class IncomingPhoneNumberList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :incoming_phone_numbers
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/IncomingPhoneNumbers.json"
            instance_id_key 'sid'
            instance_class IncomingPhoneNumberInstance
            list_key 'incoming_phone_numbers'
            components Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::LocalList,
                       Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::MobileList,
                       Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::TollFreeList
          end
          
          def buy(phone_number)
            create phone_number: phone_number
          end
        end
      
        class IncomingPhoneNumberInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={}, query_params={})
            super
            path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
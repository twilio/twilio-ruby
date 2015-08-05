module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class AddressList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :addresses
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Addresses.json"
            instance_id_key 'sid'
            instance_class AddressInstance
            list_key 'addresses'
          end
        end
      
        class AddressInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Addresses/#{@sid}.json"
            instance_id_key 'sid'
            dependent Twilio::Resources::V2010::AccountInstance::AddressInstance::DependentPhoneNumberList, {
              account_sid: @account_sid,
              address_sid: @sid
            }
          end
        end
      end
    end
  end
end
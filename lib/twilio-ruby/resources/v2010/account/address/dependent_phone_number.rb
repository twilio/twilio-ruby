module Twilio
  module Resources
    module V2010
      class AccountInstance
        class AddressInstance
          class DependentPhoneNumberList < ListResource
            can :list
            command_alias :dependent_phone_numbers
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Addresses/#{@address_sid}/DependentPhoneNumbers.json"
              instance_id_key 'sid'
              instance_class DependentPhoneNumberInstance
              list_key 'dependent_phone_numbers'
            end
          end
        
          class DependentPhoneNumberInstance < InstanceResource
            def initialize(client, inheritance={}, params={})
              super
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end
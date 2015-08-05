module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class AddressInstance < Twilio::REST::InstanceResource
          class DependentPhoneNumberList < Twilio::REST::ListResource
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
        
          class DependentPhoneNumberInstance < Twilio::REST::InstanceResource
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
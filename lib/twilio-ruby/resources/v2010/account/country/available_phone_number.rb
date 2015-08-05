module Twilio
  module Resources
    module V2010
      class AccountInstance
        class CountryInstance
          class AvailablePhoneNumberList < ListResource
            can :list
            command_alias :available_phone_numbers
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/TollFree.json"
              instance_id_key 'sid'
              instance_class AvailablePhoneNumberInstance
            end
          end
        
          class AvailablePhoneNumberInstance < InstanceResource
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
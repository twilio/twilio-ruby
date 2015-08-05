module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class AvailablePhoneNumberCountryInstance < Twilio::REST::InstanceResource
          class LocalList < Twilio::REST::ListResource
            can :list
            command_alias :local
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/Local.json"
              instance_id_key 'sid'
              instance_class LocalInstance
              list_key 'available_phone_numbers'
            end
          end
        
          class LocalInstance < Twilio::REST::InstanceResource
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
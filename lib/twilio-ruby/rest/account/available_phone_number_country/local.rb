module Twilio
  module REST
    class Account
      class AvailablePhoneNumberCountry
        class Local < ListResource
          can :list

          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/#{@country_code}/Local.json"
            list_key 'available_phone_numbers'
            instance_class LocalInstance
            instance_id_key 'sid'
          end
        end

        class LocalInstance < InstanceResource; end
      end
    end
  end
end

module Twilio
  module REST
    class Account
      class AvailablePhoneNumberCountry
        class TollFree < ListResource
          can :list

          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/#{@country_code}/TollFree.json"
            list_key 'available_phone_numbers'
            instance_class TollFreeInstance
            instance_id_key 'sid'
          end
        end

        class TollFreeInstance < InstanceResource; end
      end
    end
  end
end

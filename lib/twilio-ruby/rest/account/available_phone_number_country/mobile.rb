module Twilio
  module REST
    class Account
      class AvailablePhoneNumberCountry
        class Mobile < ListResource
          can :list

          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/#{@country_code}/Mobile.json"
            list_key 'available_phone_numbers'
            instance_class MobileInstance
            instance_id_key 'sid'
          end
        end

        class MobileInstance < InstanceResource; end
      end
    end
  end
end

module Twilio
  module REST
    class AvailablePhoneNumberCountry
      class Local < ListResource
        can :list

        def initialize(client)
          super
          path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/#{@country_code}/Local.json"
          list_key 'available_phone_numbers'
          instance_id_key 'sid'
        end
      end
    end
  end
end

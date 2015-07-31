module Twilio
  module REST
    class Account
      class AvailablePhoneNumberCountries < ListResource
        can :list, :get

        def initialize(client, inheritance={})
          super
          path "/Accounts/#{@account_sid}/AvailablePhoneNumbers.json"
          list_key 'countries'
          instance_id_key 'country_code'
          instance_class Twilio::REST::Account::AvailablePhoneNumberCountry
          command_alias :available_phone_numbers
        end
      end

      class AvailablePhoneNumberCountry < InstanceResource
        def initialize(client, inheritance={}, params={})
          super
          path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/#{@country_code}.json"
          instance_id_key 'country_code'
          dependents self.class::Local,
                     self.class::Mobile,
                     self.class::TollFree
        end
      end
    end
  end
end

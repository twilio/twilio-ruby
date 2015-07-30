module Twilio
  module REST
    class AvailablePhoneNumberCountries < ListResource
      can :list, :get

      def initialize(client)
        super
        path "/Accounts/#{@account_sid}/AvailablePhoneNumbers.json"
        instance_id_key 'country_code'
      end
    end

    class AvailablePhoneNumberCountry < InstanceResource
      def initialize(path, client, params={})
        super
        path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/#{@country_code}.json"
      end
    end
  end
end

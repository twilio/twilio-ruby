module Twilio
  module REST
    class Accounts < ListResource
      can :list, :get, :create

      def initialize(client, inheritance={})
        super
        path "/Accounts.json"
        instance_class Account
      end
    end

    class Account < InstanceResource
      can :update, :delete

      def initialize(client, inheritance={}, params={})
        super
        path "/Accounts/#{@sid}.json"
        dependents self.class::Calls,
                   self.class::AvailablePhoneNumberCountries
      end
    end
  end
end

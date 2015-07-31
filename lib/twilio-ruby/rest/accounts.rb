module Twilio
  module REST
    class Accounts < ListResource
      can :list, :get, :create

      def initialize(client, inheritance={})
        super
        path "/Accounts.json"
      end
    end

    class Account < InstanceResource
      can :update, :delete

      def initialize(client, inheritance={}, params={})
        super
        path "/Accounts/#{@sid}.json"
        dependents :calls,
                   :available_phone_number_countries
      end
    end
  end
end

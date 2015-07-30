module Twilio
  module REST
    class Accounts < ListResource
      can :list, :get, :create

      def initialize(client)
        super
        path "/Accounts.json"
      end
    end

    class Account < InstanceResource
      can :update, :delete

      def initialize(client, params={})
        super
        path "/Accounts/#{@sid}.json"
      end
    end
  end
end

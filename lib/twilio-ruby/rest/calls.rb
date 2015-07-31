module Twilio
  module REST
    class Account
      class Calls < ListResource
        can :list, :get, :create
        
        def initialize(client, inheritance={})
          super
          path "/Accounts/#{@account_sid}/Calls.json"
        end

        def make(from, to, url)
          create from: from, to: to, url: url
        end
      end

      class Call < InstanceResource
        def initialize(client, inheritance={}, params={})
          super
          path "/Accounts/#{@account_sid}/Calls/#{@sid}.json"
        end

        def redirect_to(url)
          update url: url
        end

        def cancel
          update status: 'canceled'
        end

        def hangup
          update status: 'completed'
        end
      end
    end
  end
end

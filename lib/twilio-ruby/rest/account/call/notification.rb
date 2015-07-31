module Twilio
  module REST
    class Account
      class Call
        class Notifications < ListResource
          can :list

          def initialize(client)
            super
            path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Notifications.json"
          end
        end

        class Notification < InstanceResource
          can :delete
          def initialize(client, params={})
            super
            path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Notifications/#{@sid}.json"
          end
        end
      end
    end
  end
end

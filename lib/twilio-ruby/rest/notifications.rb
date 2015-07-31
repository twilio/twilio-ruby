module Twilio
  module REST
    class Notifications < ListResource
      def initialize(client)
        super
        path "/Accounts/#{@account_sid}/Notifications.json"
      end
    end

    class Notification < InstanceResource
      def initialize(client, params={})
        super
        path "/Accounts/#{@account_sid}/Notifications/#{@sid}.json"
      end
    end
  end
end

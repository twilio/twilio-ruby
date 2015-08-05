module Twilio
  module Resources
    module V2010
      class AccountInstance
        class NotificationList < ListResource
          can :list, :get
          command_alias :notifications
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Notifications"
            instance_id_key 'sid'
            instance_class NotificationInstance
            list_key 'notifications'
          end
        end
      
        class NotificationInstance < InstanceResource
          can :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Notifications/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
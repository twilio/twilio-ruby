module Twilio
  module Resources
    module V2010
      class AccountInstance
        class AuthorizedConnectAppList < ListResource
          can :list, :get
          command_alias :authorized_connect_apps
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/AuthorizedConnectApps.json"
            instance_id_key 'connect_app_sid'
            instance_class AuthorizedConnectAppInstance
            list_key 'authorized_connect_apps'
          end
        end
      
        class AuthorizedConnectAppInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/AuthorizedConnectApps/#{@sid}.json"
            instance_id_key 'connect_app_sid'
          end
        end
      end
    end
  end
end
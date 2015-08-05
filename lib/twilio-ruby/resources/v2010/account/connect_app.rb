module Twilio
  module Resources
    module V2010
      class AccountInstance
        class ConnectAppList < ListResource
          can :list, :get
          command_alias :connect_apps
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/ConnectApps.json"
            instance_id_key 'sid'
            instance_class ConnectAppInstance
          end
        end
      
        class ConnectAppInstance < InstanceResource
          can :update
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/ConnectApps/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
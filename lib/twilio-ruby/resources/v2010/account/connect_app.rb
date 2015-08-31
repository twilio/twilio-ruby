module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class ConnectAppList < Twilio::REST::ListResource
          can :list, :get
          command_alias :connect_apps
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/ConnectApps.json"
            instance_id_key 'sid'
            instance_class ConnectAppInstance
            list_key 'connect_apps'
          end
        end
      
        class ConnectAppInstance < Twilio::REST::InstanceResource
          can :update
          
          def initialize(client, inheritance={}, params={}, query_params={})
            super
            path "/Accounts/#{@account_sid}/ConnectApps/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
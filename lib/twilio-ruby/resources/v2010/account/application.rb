module Twilio
  module Resources
    module V2010
      class AccountInstance
        class ApplicationList < ListResource
          can :list, :get, :create
          command_alias :applications
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Applications.json"
            instance_id_key 'sid'
            instance_class ApplicationInstance
          end
        end
      
        class ApplicationInstance < InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Applications/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
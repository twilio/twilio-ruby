module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SandboxList < ListResource
          can :get
          command_alias :sandboxes
          
          def initialize(client, inheritance={})
            super
            instance_id_key 'sid'
            instance_class SandboxInstance
          end
        end
      
        class SandboxInstance < InstanceResource
          can :update
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Sandbox.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
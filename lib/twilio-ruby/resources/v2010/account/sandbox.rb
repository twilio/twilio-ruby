module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class SandboxList < Twilio::REST::ListResource
          can :get
          command_alias :sandbox
          
          def initialize(client, inheritance={})
            super
            instance_id_key 'sid'
            instance_class SandboxInstance
          end
        end
      
        class SandboxInstance < Twilio::REST::InstanceResource
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
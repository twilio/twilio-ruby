module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageTriggerList < ListResource
            can :list, :get, :create
            command_alias :usage_triggers
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Usage/Triggers.json"
              instance_id_key 'sid'
              instance_class UsageTriggerInstance
            end
          end
        
          class UsageTriggerInstance < InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/Usage/Triggers/#{@sid}.json"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end
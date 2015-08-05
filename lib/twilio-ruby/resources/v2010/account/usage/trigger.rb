module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class TriggerList < ListResource
            can :list, :get, :create
            command_alias :triggers
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Usage/Triggers.json"
              instance_id_key 'sid'
              instance_class TriggerInstance
              list_key 'usage_triggers'
            end
          end
        
          class TriggerInstance < InstanceResource
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
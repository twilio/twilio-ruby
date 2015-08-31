module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class UsageList < Twilio::REST::ListResource
          class TriggerList < Twilio::REST::ListResource
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
        
          class TriggerInstance < Twilio::REST::InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={}, query_params={})
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
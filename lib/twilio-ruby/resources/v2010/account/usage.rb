module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList < ListResource
          command_alias :usage
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Usage.json"
            instance_id_key 'sid'
            instance_class UsageInstance
            components Twilio::Resources::V2010::AccountInstance::UsageList::RecordList,
                       Twilio::Resources::V2010::AccountInstance::UsageList::TriggerList
          end
        end
      
        class UsageInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
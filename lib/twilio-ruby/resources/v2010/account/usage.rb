module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class UsageList < Twilio::REST::ListResource
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
      
        class UsageInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={}, query_params={})
            super
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
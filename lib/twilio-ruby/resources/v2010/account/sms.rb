module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SmsList < ListResource
          command_alias :sms
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/SMS.json"
            instance_id_key 'sid'
            instance_class SmsInstance
            components Twilio::Resources::V2010::AccountInstance::SmsList::SmsMessageList,
                       Twilio::Resources::V2010::AccountInstance::SmsList::ShortCodeList
          end
        end
      
        class SmsInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
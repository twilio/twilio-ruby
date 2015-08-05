module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class SmsList < Twilio::REST::ListResource
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
      
        class SmsInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end
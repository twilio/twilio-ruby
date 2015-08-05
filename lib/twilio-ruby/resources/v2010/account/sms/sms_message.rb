module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SmsList
          class SmsMessageList < ListResource
            can :list, :get, :create
            command_alias :sms_messages
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/SMS/Messages.json"
              instance_id_key 'sid'
              instance_class SmsMessageInstance
            end
          end
        
          class SmsMessageInstance < InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/SMS/Messages/#{@sid}.json"
              instance_id_key 'sid'
              dependent Twilio::Resources::V2010::AccountInstance::MessageInstance::MediaList, {
                account_sid: @account_sid,
                sms_message_sid: @sid
              }
            end
          end
        end
      end
    end
  end
end
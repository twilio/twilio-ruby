module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class MessageList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :messages
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Messages.json"
            instance_id_key 'sid'
            instance_class MessageInstance
            list_key 'messages'
          end
        end
      
        class MessageInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Messages/#{@sid}.json"
            instance_id_key 'sid'
            dependent Twilio::Resources::V2010::AccountInstance::MessageInstance::MediaList, {
              account_sid: @account_sid,
              message_sid: @sid
            }
          end
          
          def redact
            update body: ''
          end
        end
      end
    end
  end
end
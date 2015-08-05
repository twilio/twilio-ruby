module Twilio
  module Resources
    module V2010
      class AccountInstance
        class MessageList < ListResource
          can :list, :get, :create
          command_alias :messages
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Messages.json"
            instance_id_key 'sid'
            instance_class MessageInstance
          end
        end
      
        class MessageInstance < InstanceResource
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
module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class QueueList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :queues
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Queues.json"
            instance_id_key 'sid'
            instance_class QueueInstance
            list_key 'queues'
          end
        end
      
        class QueueInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Queues/#{@sid}.json"
            instance_id_key 'sid'
            dependent Twilio::Resources::V2010::AccountInstance::QueueInstance::MemberList, {
              account_sid: @account_sid,
              queue_sid: @sid
            }
          end
        end
      end
    end
  end
end
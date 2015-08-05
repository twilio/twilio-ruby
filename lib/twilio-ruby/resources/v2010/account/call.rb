module Twilio
  module Resources
    module V2010
      class AccountInstance
        class CallList < ListResource
          can :list, :get, :create
          command_alias :calls
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Calls.json"
            instance_id_key 'sid'
            instance_class CallInstance
            list_key 'calls'
            components Twilio::Resources::V2010::AccountInstance::CallList::FeedbackSummaryList
          end
          
          def make(from, to, url)
            create from: from, to: to, url: url
          end
        end
      
        class CallInstance < InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Calls/#{@sid}.json"
            instance_id_key 'sid'
            dependent Twilio::Resources::V2010::AccountInstance::CallInstance::RecordingList, {
              account_sid: @account_sid,
              call_sid: @sid
            }
            dependent Twilio::Resources::V2010::AccountInstance::CallInstance::NotificationList, {
              account_sid: @account_sid,
              call_sid: @sid
            }
            dependent Twilio::Resources::V2010::AccountInstance::CallInstance::FeedbackList, {
              account_sid: @account_sid,
              call_sid: @sid
            }
          end
          
          def redirect_to(url)
            update url: url
          end
          
          def cancel
            update status: 'canceled'
          end
          
          def hangup
            update status: 'completed'
          end
        end
      end
    end
  end
end
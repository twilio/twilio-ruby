module Twilio
  module Resources
    module V2010
      class AccountInstance
        class CallInstance
          class FeedbackList < ListResource
            can :get, :create
            command_alias :feedbacks
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Calls/#{@parent_sid}/Feedback.json"
              instance_id_key 'sid'
              instance_class FeedbackInstance
            end
          end
        
          class FeedbackInstance < InstanceResource
            can :update
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/Calls/#{@parent_sid}/Feedback.json"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end
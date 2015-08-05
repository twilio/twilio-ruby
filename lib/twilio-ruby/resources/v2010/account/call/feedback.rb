module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class CallInstance < Twilio::REST::InstanceResource
          class FeedbackList < Twilio::REST::ListResource
            can :get, :create
            command_alias :feedback
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Feedback.json"
              instance_id_key 'sid'
              instance_class FeedbackInstance
            end
          end
        
          class FeedbackInstance < Twilio::REST::InstanceResource
            can :update
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Feedback.json"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end
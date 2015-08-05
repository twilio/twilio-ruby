module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class CallList < Twilio::REST::ListResource
          class FeedbackSummaryList < Twilio::REST::ListResource
            can :get, :create
            command_alias :feedback_summaries
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Calls/FeedbackSummary.json"
              instance_id_key 'sid'
              instance_class FeedbackSummaryInstance
            end
          end
        
          class FeedbackSummaryInstance < Twilio::REST::InstanceResource
            can :delete
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/Calls/FeedbackSummary/#{@sid}.json"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end
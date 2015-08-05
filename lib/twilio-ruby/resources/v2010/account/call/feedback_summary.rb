module Twilio
  module Resources
    module V2010
      class AccountInstance
        class CallList
          class FeedbackSummaryList < ListResource
            can :get, :create
            command_alias :feedback_summaries
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Calls/FeedbackSummary.json"
              instance_id_key 'sid'
              instance_class FeedbackSummaryInstance
            end
          end
        
          class FeedbackSummaryInstance < InstanceResource
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
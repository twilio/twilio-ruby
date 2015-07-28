module Twilio
  module REST
    class Call
      class Feedback < ListResource
        def initialize(path, client)
          path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Feedback.json"
        end
      end

      class FeedbackInstance < InstanceResource
        def initialize(path, client, params={})
          path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Feedback.json"
        end
      end
    end
  end
end

module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class CallInstance < Twilio::REST::InstanceResource
          class FeedbackList < Twilio::REST::ListResource
            def get(sid=nil)
              internal_get sid
            end
          end
        end
      end
    end
  end
end

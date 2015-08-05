module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class QueueInstance < Twilio::REST::InstanceResource
          class MemberList < Twilio::REST::ListResource
            def front
              get "Front"
            end

            def front!
              front.refresh
            end

            def dequeue(url, method='POST')
              front.dequeue url, method
            end
          end
        end
      end
    end
  end
end

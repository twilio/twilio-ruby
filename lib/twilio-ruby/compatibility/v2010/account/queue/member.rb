module Twilio
  module Resources
    module V2010
      class AccountInstance
        class QueueInstance
          class MemberList
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

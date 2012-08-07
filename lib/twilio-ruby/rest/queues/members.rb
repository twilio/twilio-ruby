module Twilio
  module REST
    class Members < ListResource
      def initialize(uri, client)
        super
        # hard-code the json key since members don't have sids
        @instance_id_key = 'call_sid'
      end
    end

    class Member < InstanceResource
      def dequeue(url)
        update :url => url
      end
    end
  end
end

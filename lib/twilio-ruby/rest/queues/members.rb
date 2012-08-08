module Twilio
  module REST
    class Members < ListResource
      def initialize(uri, client)
        super
        # hard-code the json keys since members are special
        @list_key, @instance_id_key = 'queue_members', 'call_sid'
      end
    end

    class Member < InstanceResource
      def dequeue(url, method='POST')
        update :url => url, :method => method
      end
    end
  end
end

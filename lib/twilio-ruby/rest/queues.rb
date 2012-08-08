module Twilio
  module REST
    class Queues < ListResource
      def initialize(uri, client)
        super
        # hard-code the json key since 'members' doesn't exist in the response
        @list_key = 'queue_members'
      end
    end

    class Queue < InstanceResource
      def initialize(uri, client, params={})
        super uri, client, params
        resource :members
      end
    end
  end
end

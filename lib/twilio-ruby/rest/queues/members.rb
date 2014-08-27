module Twilio
  module REST
    class Members < ListResource
      def initialize(path, client)
        super
        # hard-code the json keys since members are special
        @list_key, @instance_id_key = 'queue_members', 'call_sid'
      end

      def front
        @instance_class.new "#{@path}/Front", @client
      end

      def front!
        front.refresh
      end

      def dequeue(url, method='POST')
        front.dequeue url, method
      end
    end

    class Member < InstanceResource
      def dequeue(url, method='POST')
        update url: url, method: method
      end
    end
  end
end

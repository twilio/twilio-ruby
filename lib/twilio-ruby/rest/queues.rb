module Twilio
  module REST
    class Queues < ListResource; end

    class Queue < InstanceResource
      def initialize(uri, client, params={})
        super uri, client, params
        resource :members
      end
    end
  end
end

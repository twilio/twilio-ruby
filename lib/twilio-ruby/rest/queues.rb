module Twilio
  module REST
    class Queues < ListResource; end

    class Queue < InstanceResource
      def initialize(path, client, params={})
        super path, client, params
        resource :members
      end
    end
  end
end

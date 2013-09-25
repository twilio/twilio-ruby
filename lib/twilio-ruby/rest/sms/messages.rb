module Twilio
  module REST
    class Messages < ListResource
      def initialize(path, client)
        path.sub! '/SMS', ''
        super
      end
    end

    class Message < InstanceResource; end
  end
end

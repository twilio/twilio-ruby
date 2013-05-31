module Twilio
  module REST
    class Messages < ListResource
      def initialize(path, client)
        super
        # hard-code the json key since 'messages' doesn't exist in the response
        @list_key = 'sms_messages'
      end
    end

    class Message < InstanceResource; end
  end
end

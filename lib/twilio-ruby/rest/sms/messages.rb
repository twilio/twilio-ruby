module Twilio
  module REST
    module SMS
      class Messages < ListResource
        def initialize(path, client)
          super
          @list_key = 'sms_messages'
        end
      end

      class Message < InstanceResource
      end
    end
  end
end

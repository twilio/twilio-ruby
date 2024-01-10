# frozen_string_literal: true
module Twilio
  module REST
    class PreviewMessaging < PreviewMessagingBase
      def message
        self.v1.messages
      end
      def broadcast
        self.v1.broadcasts
      end
    end
  end
end


module Twilio
  module REST
    class PreviewMessagingBase < Domain
      def initialize(twilio)
        super(twilio)
        @base_url =  "https://preview.messaging.twilio.com"
        @host = "preview.messaging.twilio.com"
        @port = 443
        @v1 = nil
      end

      def v1
        @v1 ||= PreviewMessaging::V1.new self
      end

      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio::REST::PreviewMessaging::V1>';
      end
    end
  end
end
##
 # This code was generated by
 # ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
 #  |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
 #  |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
 #
 # NOTE: This class is auto generated by OpenAPI Generator.
 # https://openapi-generator.tech
 # Do not edit the class manually.
# frozen_string_literal: true
module Twilio
  module REST
    class MessagingBase < Domain
      ##
      # Initialize messaging domain
      #
      # @param twilio - The twilio client
      #
      def initialize(twilio)
        super(twilio)
        @base_url =  "https://messaging.twilio.com"
        @host = "messaging.twilio.com"
        @port = 443
        @v1 = nil
        @v2 = nil
      end

      def v1
        @v1 ||= Messaging::V1.new self
      end

      def v2
        @v2 ||= Messaging::V2.new self
      end

      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio::REST::Messaging>';
      end
    end
  end
end

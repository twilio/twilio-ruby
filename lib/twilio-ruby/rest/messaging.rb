##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Messaging < Domain
      ##
      # Initialize the Messaging Domain
      def initialize(twilio)
        super

        @base_url = 'https://messaging.twilio.com'
        @host = 'messaging.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of messaging
      def v1
        @v1 ||= V1.new self
      end

      def services(sid=:unset)
        self.v1.services(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Messaging>'
      end
    end
  end
end
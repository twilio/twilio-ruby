module Twilio
  module REST
    class Participants < ListResource
      private
      def instance_sid_key
        'call_sid'
      end
    end

    class Participant < InstanceResource
      def mute
        update :muted => 'true'
      end

      def unmute
        update :muted => 'false'
      end

      alias :kick :delete
    end
  end
end

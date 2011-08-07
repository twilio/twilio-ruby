module Twilio
  module REST
    class Participants < ListResource
      def sid_key # :nodoc:
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

module Twilio
  module REST
    class Participants < ListResource
      def initialize(path, client)
        super
        @instance_id_key = 'call_sid'
      end
    end

    class Participant < InstanceResource
      def mute
        update muted: 'true'
      end

      def unmute
        update muted: 'false'
      end

      def kick
        delete
      end
    end
  end
end

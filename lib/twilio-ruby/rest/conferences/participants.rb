module Twilio
  module REST
    class Participants < ListResource
      def initialize(path, client)
        super
        # hard-code the json key since participants don't have sids
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

      alias :kick :delete
    end
  end
end

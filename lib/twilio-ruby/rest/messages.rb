module Twilio
  module REST
    class Messages < ListResource
      def initialize(path, client)
        path.gsub! '/SMS', ''
        super
      end
    end

    class Message < InstanceResource
      def initialize(path, client, params={})
        super
        resource :media
      end

      def redact()
        update({body: ''})
      end

    end
  end
end

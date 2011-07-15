module Twilio
  module REST
    class Recording < InstanceResource

      def initialize(uri, client, params={})
        super uri, client, params
        resource :transcriptions
      end

    end
  end
end

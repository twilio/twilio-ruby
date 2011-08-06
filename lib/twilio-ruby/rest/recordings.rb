module Twilio
  module REST
    class Recordings < ListResource; end

    class Recording < InstanceResource
      def initialize(uri, client, params={})
        super uri, client, params
        resource :transcriptions
      end
    end
  end
end

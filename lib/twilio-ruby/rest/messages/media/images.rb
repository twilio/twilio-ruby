module Twilio
  module REST
    class Images < InstanceResource
      def initialize(path, client, params={})
        super path, client, params
      end
    end
  end
end

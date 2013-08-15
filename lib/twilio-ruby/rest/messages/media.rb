module Twilio
  module REST
    class Media < InstanceResource
      def initialize(path, client, params={})
        super
        resource :images
      end
    end
  end
end

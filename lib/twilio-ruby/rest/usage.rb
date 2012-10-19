module Twilio
  module REST
    class Usage < InstanceResource
      def initialize(uri, client, params={})
        super
        resource :records, :triggers
      end
    end
  end
end

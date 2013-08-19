module Twilio
  module REST
    class Media < ListResource
      def initialize(path, client, params={})
        super
        resource :images
      end
    end

    class MediaInstance < InstanceResource; end
  end
end

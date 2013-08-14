module Twilio
  module REST
    class Messages < ListResource
      def initialize(path, client)
        super
      end
    end
    class Messages < InstanceResource; 
        resource :media
    end
  end
end

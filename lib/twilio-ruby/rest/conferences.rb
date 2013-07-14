module Twilio
  module REST
    class Conferences < ListResource; end

    class Conference < InstanceResource
      def initialize(path, client, params={})
        super path, client, params
        resource :participants
      end
    end
  end
end

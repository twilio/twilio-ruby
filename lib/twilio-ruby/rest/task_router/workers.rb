module Twilio
  module REST
    module TaskRouter
      class Workers < Twilio::REST::NextGenListResource
        include Twilio::REST::TaskRouter::Statistics
      end

      class Worker < InstanceResource
        include Twilio::REST::TaskRouter::Statistics
      end
    end
  end
end
